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

  /* Motion and glow effect on hover */
  .course-card::before {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(45deg, #1a3fff, #0d1b4c, #1a3fff);
    background-size: 400% 400%;
    filter: blur(20px);
    opacity: 0;
    transition: opacity 0.3s ease, transform 0.3s ease;
    border-radius: inherit;
  }

  .course-card:hover::before {
    opacity: 0.6;
    animation: glow 2s linear infinite;
  }

  @keyframes glow {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
  }

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
