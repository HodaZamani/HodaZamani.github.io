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
    padding-top: 30%; /* smaller square */
    position: relative;
    perspective: 1000px; 
    margin-bottom: 15px;
  }

  .flip-card-inner {
    position: absolute;
    top: 0;
    left: 0;
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
    color: white;
    font-size: 1rem; /* reduced font size */
    background-color: #0d1b4c; /* dark blue */
  }

  .flip-card-back {
    transform: rotateY(180deg);
  }
</style>

<div class="row mt-4">
  <!-- First row -->
  <div class="col-md-6 col-sm-6 mb-3">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Operation Systems and its Lab
        </div>
        <div class="flip-card-back">
          Operation Systems and its Lab
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6 col-sm-6 mb-3">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Artificial Intelligence
        </div>
        <div class="flip-card-back">
          Artificial Intelligence
        </div>
      </div>
    </div>
  </div>

  <!-- Second row -->
  <div class="col-md-6 col-sm-6 mb-3">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Machine Learning and Deep Learning Architectures
        </div>
        <div class="flip-card-back">
          Neuroimaging Data Processing and Analysis with Python
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6 col-sm-6 mb-3">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Python Programming Language and its Libraries
        </div>
        <div class="flip-card-back">
          TensorFlow, Keras, PyTorch, OpenCV, scikit-image, MediaPipe, Biopython, and PyTorch Geometric
        </div>
      </div>
    </div>
  </div>

  <!-- Third row -->
  <div class="col-md-6 col-sm-6 mb-3">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Quantum Computing
        </div>
        <div class="flip-card-back">
          Quantum Computing
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6 col-sm-6 mb-3">
    <div class="flip-card">
      <div class="flip-card-inner">
        <div class="flip-card-front">
          Optimization and Bio-Inspired Algorithms
        </div>
        <div class="flip-card-back">
          Implementation with MATLAB Programming Language
        </div>
      </div>
    </div>
  </div>
</div>
