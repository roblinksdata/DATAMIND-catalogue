# DATAMIND Resource Catalogue

A Jekyll and GitHub Pages repository for curating data resources, software and data pipelines that support analysis of mental health outcomes.

## Repository structure

- `_data-resources/`: one Markdown file per data resource
- `_software/`: one Markdown file per software resource
- `_data-pipelines/`: one Markdown file per pipeline
- `_templates/`: copyable entry template
- `index.md`: automatically assembles all three collections
- `_layouts/`, `_includes/`, `assets/`: Jekyll presentation layer
- `scripts/validate_catalogue.rb`: metadata and URL validation
- `.github/ISSUE_TEMPLATE/`: guided change request
- `.github/workflows/`: validation and Pages deployment

## Publish on GitHub Pages

The deployment workflow will publish to `https://datamind-uk.github.io/catalogue/`.

## Add an entry

Copy `_templates/catalogue-entry.md` to the appropriate collection folder, rename it, complete its YAML front matter, and commit it. The home page updates automatically.

## Local preview

(bundle is part of ruby)

```bash
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000/catalogue/`.

## Validate entries

```bash
ruby scripts/validate_catalogue.rb
```

The included entries are fictional examples and must be replaced with verified resources before launch.
