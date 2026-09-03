---
layout: home
title: Catalogue
---

{% assign total = site.data_resources.size | plus: site.software.size | plus: site.data_pipelines.size %}

<div class="intro">
  <p class="eyebrow">Better mental health through data-driven research</p>
  <h1>DATAMIND Resource Catalogue</h1>
  <p class="lead">Discover data resources, software and reusable pipelines that can support analysis and generate insights into mental health outcomes.</p>
  <p><strong>{{ total }}</strong> catalogue entries across three categories.</p>
</div>

{% include catalogue-section.html title="Data pipelines" description="Reusable workflows for preparing, linking and analysing data." entries=site.data_pipelines %}
{% include catalogue-section.html title="Data resources" description="Datasets, collections and services that support mental health research." entries=site.data_resources %}
{% include catalogue-section.html title="Software" description="Tools and packages for working with clinical and other data sources." entries=site.software %}

<section class="contribute">
  <h2>Suggest a resource or correction</h2>
  <p>Read our <a class="button button-secondary" href="{{  site.github_repo_url }}blob/main/CONTRIBUTING.md">Contribution guide</a>for information on how to add or amend a catalogue entry.</p>
</section>
