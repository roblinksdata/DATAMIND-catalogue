#!/usr/bin/env ruby
require "yaml"
require "uri"

collections = %w[_data-resources _software _data-pipelines]
required = %w[title description authors institutions links]
errors = []
files = collections.flat_map { |folder| Dir.glob(File.join(folder, "**", "*.md")) }

files.each do |path|
  text = File.read(path)
  match = text.match(/\A---\s*\n(.*?)\n---\s*(?:\n|\z)/m)
  unless match
    errors << "#{path}: missing valid YAML front matter"
    next
  end
  begin
    data = YAML.safe_load(match[1], permitted_classes: [], aliases: false) || {}
  rescue Psych::SyntaxError => e
    errors << "#{path}: invalid YAML (#{e.message.lines.first.strip})"
    next
  end
  required.each do |field|
    value = data[field]
    errors << "#{path}: '#{field}' is required" if value.nil? || (value.respond_to?(:empty?) && value.empty?)
  end
  %w[authors institutions].each do |field|
    errors << "#{path}: '#{field}' must be a non-empty list" unless data[field].is_a?(Array) && data[field].all? { |v| v.is_a?(String) && !v.strip.empty? }
  end
  if data["description"].is_a?(String) && data["description"].length > 300
    errors << "#{path}: description must be 300 characters or fewer"
  end
  if data["links"].is_a?(Array)
    data["links"].each_with_index do |link, i|
      unless link.is_a?(Hash) && link["label"].is_a?(String) && link["url"].is_a?(String)
        errors << "#{path}: link #{i + 1} must contain string 'label' and 'url' values"
        next
      end
      begin
        uri = URI.parse(link["url"])
        errors << "#{path}: link #{i + 1} must use https://" unless uri.is_a?(URI::HTTPS) && uri.host
      rescue URI::InvalidURIError
        errors << "#{path}: link #{i + 1} is not a valid URL"
      end
    end
  else
    errors << "#{path}: 'links' must be a non-empty list"
  end
end

errors << "No catalogue entries found" if files.empty?
if errors.any?
  warn "Catalogue validation failed:"
  errors.each { |error| warn "- #{error}" }
  exit 1
end
puts "Validated #{files.length} catalogue entries successfully."
