---
layout: post
date: 2024-07-01 13:00:00 +0000
title: Practical Docx
categories: [Material, Sem5]
excerpt: "Comprehensive collection of practical documents for various subjects."
image: /assets/img/logo/dog.webp
published: false
---

# Practical Documents Collection

{% for subject in site.data.practicals.subjects %}
## Subject: {{ subject.name }}

<details{% if forloop.first %} open{% endif %}>
  <summary>Click to see all practicals</summary>
  <ul>
    {% for doc in subject.documents %}
    <li><a href="{{ doc.file }}" download>{{ doc.title }}</a></li>
    {% endfor %}
  </ul>
</details>
{% endfor %}

<script>
  document.addEventListener("DOMContentLoaded", function() {
    const detailsElements = document.querySelectorAll('details');
    
    detailsElements.forEach(detail => {
      detail.addEventListener('click', function() {
        detailsElements.forEach(el => {
          if (el !== detail) {
            el.removeAttribute('open');
          }
        });
      });
    });
  });
</script>
