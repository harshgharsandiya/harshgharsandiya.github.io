---
layout: post
date: 2024-07-07 13:00:00 +0000
categories: [Material, Sem5]
excerpt: "Comprehensive collection of practical documents for various subjects."
---

# Practical Documents Collection

## Subject: INS

<details open>
  <summary>Click to see all practicals</summary>
  <ul>
    <li><a href="/assets/docx/ins/ET22BTCO037_INS_p1.docx" download>Practical 1</a></li>
    <li><a href="/assets/docx/ins/ET22BTCO037_INS_p2.docx" download>Practical 2</a></li>
    <!-- Add more documents as needed -->
  </ul>
</details>

## Subject: WT

<details>
  <summary>Click to see all practicals</summary>
  <ul>
    <li><a href="/assets/docx/wt/ET22BTCO037_WT_p1.docx" download>Practical 1</a></li>
    <li><a href="/assets/docx/wt/ET22BTCO037_WT_p2.docx" download>Practical 2</a></li>
    <li><a href="/assets/docx/wt/ET22BTCO037_WT_p3.docx" download>Practical 3</a></li>
    <!-- Add more documents as needed -->
  </ul>
</details>

## Subject: EAD

<details>
  <summary>Click to see all practicals</summary>
  <ul>
    <li><a href="/assets/docx/ead/ET22BTCO037_EAD_p1.docx" download>Practical 1</a></li>
    <!-- Add more documents as needed -->
  </ul>
</details>

## Subject: IOE Robotics

<details>
  <summary>Click to see all practicals</summary>
  <ul>
    <li><a href="/assets/docx/ioe/ET22BTCO037_IOE_p1.docx" download>Practical 1</a></li>
    <!-- Add more documents as needed -->
  </ul>
</details>

## Subject: AI

<details>
  <summary>Click to see all practicals</summary>
  <ul>
    <li><a href="/assets/docx/ai/ET22BTCO037_AI_p1.docx" download>Practical 1</a></li>
    <li><a href="/assets/docx/ai/ET22BTCO037_AI_p2.docx" download>Practical 2</a></li>
    <!-- Add more documents as needed -->
  </ul>
</details>

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
