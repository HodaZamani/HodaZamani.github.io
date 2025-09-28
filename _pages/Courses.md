---
layout: post
permalink: /Courses/
title: Courses
nav: true
nav_order: 9
---

<b>My Courses</b>

<style>
  .flip-card {
    background-color: transparent;
    width: 100%;
    height: 90px;
    perspective: 1000px; /* 3D perspective */
    margin-bottom: 15px;
  }

  .flip-card-inner {
    position: relative;
    width: 100%;
    height: 100%;
    text-align: center;
    transition: transform 0.6s;
    transform-style: preserve-3d;
    cursor: pointer;
  }

  .flip-card:hover .flip-card-inner {
    transform: rotateY(180deg);
  }

  .flip-card-front, .flip-card-back {
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 10px;
    backface-visibility: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: "Times New Roman", Times, serif;
    font-weight: bold;
    color: black;  /* changed text color to black */
    font-size: 0.95rem;
    background-color: #d3d3d3;  /* grey background */
  }

  .flip-card-back {
    transform: rotateY(180deg);
  }
</style>

<div class="row mt-4">
  <div class="col-md-6">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Operation Systems and its Lab
        </div>
        <div class="flip-card-back">
          OS Lab Details
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Artificial Intelligence
        </div>
        <div class="flip-card-back">
          AI Course Details
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Machine Learning
        </div>
        <div class="flip-card-back">
          ML Course Details
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Python Programming Languages
        </div>
        <div class="flip-card-back">
          Python Course Details
        </div>
      </div>
    </div>
  </div>
</div>
