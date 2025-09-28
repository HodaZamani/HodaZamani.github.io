---
layout: post
permalink: /Courses/
title: Courses
nav: true
nav_order: 9
---

<b>My Courses</b>

<style>
  .course-card {
    height: 120px;                
    display: flex;
    align-items: center;          
    justify-content: center;      
    background-color: #0d1b4c;    /* dark blue */
    color: white;                 
    font-family: "Times New Roman", Times, serif;
    font-weight: bold;
    font-size: 1rem;              
    border-radius: 12px;          
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
  }

  /* Motion effect on hover (no color change) */
  .course-card:hover {
    transform: scale(1.05);  
    box-shadow: 0 8px 18px rgba(0, 0, 0, 0.25); 
  }
</style>

<div class="row mt-4">
  <div class="col-md-6 mb-4">
    <div class="course-card">
      Operation Systems and its Lab
    </div>
  </div>

  <div class="col-md-6 mb-4">
    <div class="course-card">
      Artificial Intelligence
    </div>
  </div>

  <div class="col-md-6 mb-4">
    <div class="course-card">
      Machine Learning
    </div>
  </div>

  <div class="col-md-6 mb-4">
    <div class="course-card">
      Python Programming Languages
    </div>
  </div>
</div>
