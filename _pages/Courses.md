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
    height: 90px;                 
    display: flex;
    align-items: center;          
    justify-content: center;      
    background-color: #0d1b4c;    
    color: white;                 
    font-family: "Times New Roman", Times, serif;
    font-weight: bold;
    font-size: 0.95rem;           
    border-radius: 10px;          
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
  }

  /* Motion effect on hover */
  .course-card:hover {
    transform: scale(1.05);  
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); 
  }
</style>

<div class="row mt-4">
  <div class="col-md-6 mb-3">
    <div class="course-card">
      Operation Systems and its Lab
    </div>
  </div>

  <div class="col-md-6 mb-3">
    <div class="course-card">
      Artificial Intelligence
    </div>
  </div>

  <div class="col-md-6 mb-3">
    <div class="course-card">
      Machine Learning
    </div>
  </div>

  <div class="col-md-6 mb-3">
    <div class="course-card">
      Python Programming Languages
    </div>
  </div>
</div>
