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
    position: relative;
    overflow: hidden;
  }

  /* Motion effect on hover */
  .course-card:hover {
    transform: scale(1.05);  
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); 
  }

  /* Add mirrored text on left and right */
  .course-card::before,
  .course-card::after {
    content: attr(data-title);
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 0.85rem;
    opacity: 0.3;
    color: white;
    white-space: nowrap;
  }

  .course-card::before {
    left: 10px;
  }

  .course-card::after {
    right: 10px;
  }
</style>

<div class="row mt-4">
  <div class="col-md-6 mb-3">
    <div class="course-card" data-title="Operation Systems and its Lab">
      Operation Systems and its Lab
    </div>
  </div>

  <div class="col-md-6 mb-3">
    <div class="course-card" data-title="Artificial Intelligence">
      Artificial Intelligence
    </div>
  </div>

  <div class="col-md-6 mb-3">
    <div class="course-card" data-title="Machine Learning">
      Machine Learning
    </div>
  </div>

  <div class="col-md-6 mb-3">
    <div class="course-card" data-title="Python Programming Languages">
      Python Programming Languages
    </div>
  </div>
</div>
