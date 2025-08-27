---
layout: post
permalink: /contact/
title: Contact Me
nav: true
nav_order: 9
---

<hr>

<h3>Contact Me</h3>
<p>If you would like to get in touch, please fill out the form below:</p>

<form action="https://formspree.io/f/your-form-id" method="POST">
  <div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
      <label for="name"><b>Your Name (required)</b></label>
      <input type="text" id="name" name="name" class="form-control" required>
    </div>
    <div class="col-sm mt-3 mt-md-0">
      <label for="email"><b>Your Email (required)</b></label>
      <input type="email" id="email" name="_replyto" class="form-control" required>
    </div>
  </div>

  <div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
      <label for="subject"><b>Subject</b></label>
      <input type="text" id="subject" name="subject" class="form-control">
    </div>
  </div>

  <div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
      <label for="message"><b>Your Message</b></label>
      <textarea id="message" name="message" rows="6" class="form-control" required></textarea>
    </div>
  </div>

  <div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
      <button type="submit" class="btn btn-primary">Send Message</button>
    </div>
  </div>
</form>
