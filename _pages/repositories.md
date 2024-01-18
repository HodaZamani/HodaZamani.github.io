---
layout: page
permalink: /repositories/
title: Repositories
nav: true
nav_order: 4
---
<p align="justify">I have published the codes of the algorithms in different journals, and you can access them on this page. You can also click on the links to see the original papers and the guidelines for using the codes. I hope they are helpful and educational for you.

<div class="row">
<div class="col-sm mt-3 mt-md-0">
<!-- Use the download attribute to specify that the file will be downloaded -->
<a href="assets/pdf/BWOA" download>Download zip file</a>
</div>
</div>

## GitHub users

{% if site.data.repositories.github_users %}
<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user.html username=user %}
  {% endfor %}
</div>

---

{% if site.repo_trophies.enabled %}
{% for user in site.data.repositories.github_users %}
  {% if site.data.repositories.github_users.size > 1 %}
  <h4>{{ user }}</h4>
  {% endif %}
  <div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% include repository/repo_trophies.html username=user %}
  </div>

  ---

{% endfor %}
{% endif %}
{% endif %}

## GitHub Repositories

{% if site.data.repositories.github_repos %}
<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_repos %}
    {% include repository/repo.html repository=repo %}
  {% endfor %}
</div>
{% endif %}
