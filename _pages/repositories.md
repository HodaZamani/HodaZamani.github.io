---
layout: page
permalink: /repositories/
title: Repositories
nav: true
nav_order: 4
---
<p align="justify">I have published the codes of the algorithms in different journals, and you can access them on this page. You can also click on the links to see the original papers and the guidelines for using the codes. I hope they are helpful and educational for you.</p>

***
[Feature Selection Based on Whale Optimization Algorithm for Diseases Diagnosis](https://d1wqtxts1xzle7.cloudfront.net/51133098/130_Paper_310716206_IJCSIS_Camera_Ready_pp._1243-1247-libre.pdf?1483206167=&response-content-disposition=inline%3B+filename%3DFeature_Selection_Based_on_Whale_Optimiz.pdf&Expires=1705589117&Signature=c7rjMJ7QGILgXDqiTi~r6TfXfsSAS~AlGJYApTLHhmQRNLf6otjvm5~xzW-zRknWDg7JSPV03eRVl2xwEsGNB~P46McNro25HonCfmGLB2PyEQGiq~K2Xa2fBz7hij8I3OIR2htdoa1aSN5Hp9Vd0LvtrzGKSk1xDSpr0LEe9N63qB5r60i8i-Istk34MZgKYvObtg2ViOfTgQFnnN92rkTNTjwBNfzbqHR34fo1rShWPSpm4Lo0a68CIramgC7GwsM03jUnyevFvh6ttDUBoGQaau4LsMbmmaiElG~JxMhBzMHLktS4gl0dprf0dpB4D80qczE2skXWh1XTlvTQYg__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA), International Journal of Computer Science and Information Security (IJCSIS), <a href="assets/pdf/BWOA.zip" download>Download Code</a>

---

[Binary Starling Murmuration Optimizer Algorithm to Select Effective Features from Medical Data](https://www.mdpi.com/2076-3417/13/1/564), Journal Applied Sciences,
<a href="assets/pdf/BWOA.zip" download>Download Code</a>

---

[QANA: Quantum-based avian navigation optimizer algorithm](https://www.sciencedirect.com/science/article/abs/pii/S0952197621001627),
Engineering Applications of Artificial Intelligence, 
<a href="assets/pdf/BWOA.zip" download>Download Code</a>

---

[Starling murmuration optimizer: A novel bio-inspired algorithm for global and engineering optimization](https://www.sciencedirect.com/science/article/abs/pii/S0045782522000330),Computer Methods in Applied Mechanics and Engineering,
<a href="assets/pdf/BWOA.zip" download>Download Code</a>

---

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
