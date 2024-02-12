---
layout: page
title: Low-cost Detection of Type II Diabetes
description: Feature Selection Techniques and Machine Learning Algorithms
img: assets/img/12.jpg
importance: 1
category: work
related_publications: HodaImputationMethod
---
<p align="justify">The World Health Organization reported that the number of people with diabetes increased from 108 million in 1980 to 422 million in 2014. Iran ranks 14th in the world for type 2 diabetes prevalence among adults aged 20-79 and faces various complications, such as cardiovascular disease, kidney disease, eye disease, nerve damage, and foot problems. Additionally, type 2 diabetes can increase the risk of pancreatic cancer. To address this issue, we developed a low-cost diagnosis of Type II diabetes project to provide a low-cost and early diagnosis of type 2 diabetes. This way, we hope to prevent or delay the onset of diabetes-related complications and improve the quality of life of millions of Iranians.</p>

<p align="justify">The project is headed by <b>professor Mohammad H. Nadimi-Shahraki</b> as the principal investigator and <b>Dr. Hoda Zamani</b> as the co-principal investigator. 
This project is planned in four main phases:</p> 
     (A) Data Acquisition, (B) Data Preprocessing, (C) Data Modeling, and (D) Developing a Mobil App

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/DataAcqusation1.jpg" title="Example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/3.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>    
</div>

<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images.
Say you wanted to write a little bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, *bled* for your project, and then... you reveal its glory in the next row of images.


<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.html path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.html path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above:

{% raw %}

```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

{% endraw %}
