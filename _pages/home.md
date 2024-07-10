---
layout: archive
permalink: /
excerpt: "Jayanth Kumar"
author_profile: true
marp: false
---
<h1> Hey 👋 there, viewers 👀! </h1>
<h2>
I am <a href="https://jaykmr.com">Jayanth Kumar</a> 
<div>
<img src="/images/brand_animation_crop.gif" width="220" height="200" />
</div> 
</h2>

Currently building large scale software systems as SDM III at Amazon, being one of the youngest Engineering Leader in a FAANG . I am a published poet, a technical architect, an entrepreneur, an angel investor, an engineering leader and even, an assistant professor too, basically a Polymath.

Subscribe to my website to read my book *Learning System Design on AWS* or *System Manifesto* or read my poetry anthology - "*Gonzo Poet and through his lens*" or follow my blog - "*Technopreneurial Treatises*" for more engineering and entrepreneurial philosophical content.

Also, check out my startup product [Education E-board](https://edapp.jaykmr.com) for education to help students, parents and teachers in teaching and learning.  

You can book a 1:1 call or ask any queries you may have on my [email](mailto:jayanthjaiswal15@gmail.com). Whether you need help with my areas of expertise or just want to chat about anything, I'm available.

See you around 🎩



<div>
  
  <div style="float:center; border: 2px solid #e51738;text-align:center;border-radius:10px; padding:5px; background: #e51738;">
  <a href="https://learning.oreilly.com/library/view/learning-system-design/9781098146887/" style="color:white">Learning System Design on AWS</a>
  </div> 

  <div style="float:center; border: 2px solid #cfe2ef;text-align:center;border-radius:10px; padding:5px; background: #cfe2ef;">
  <a href="https://jaykmr.com/system-manifesto/" style="color:black">System Manifesto</a>
  </div> 

  <div style="float:center; border: 2px solid #292C34;text-align:center;border-radius:10px; padding:5px; background: #292C34;">
  
  <a href="https://blog.jaykmr.com" style="color:white">Blog</a>
  </div>

  <div style="float:center; border: 2px solid MistyRose;text-align:center;border-radius:10px; padding:5px; background: MistyRose;">
  <a href="https://www.amazon.in/Gonzo-Poet-through-his-lens-ebook/dp/B07M6CWQJJ/" style="color:black">Poetry Anthology</a>
  </div> 
  
</div>
<br/>
<hr width="50%" />

## Updates
- 🔨 Launch of my startup product [Education E-board](https://edapp.jaykmr.com) ✨💡
- 🔨  Release of my poetry book - [Gonzo Poet and Through his Lens](https://www.amazon.com/Gonzo-Poet-through-his-lens/dp/1792911742/ref=tmm_pap_swatch_0) with illustrations on amazon.com as paperback edition ✨ 📚
- 🔨 Acceptance of my poster presentation - [*Enhancing Protein Crystallization Prediction through Protein Embeddings*](https://iscb.junolive.co/ISMB24/live/exhibitor/ismb2024_poster_1399) in the [32nd International Conference on Intelligent Systems for Molecular Biology (ISMB) 2024](https://www.iscb.org/ismb2024/home), to be held at Montreal, Quebec, Canada 📝
- 🔨 Currently, filed patent - P84475-US01 - "Systems and Methods for defining and applying Statistical Heuristics for filtering Network Traffic" with Amazon at USPTO
- 🔨 Secured AIR 86 in GATE Data Science and Artificial Intelligence (DA), scoring 794 marks
- 🔨 Pre-release of my book - [*Learning System Design on AWS*](https://learning.oreilly.com/library/view/learning-system-design/9781098146887/)✨ 📚
- 🔨 Added gallery of my research and work associations [Gallery - Jayanth Kumar](https://jaykmr.com/gallery/)✨ 📷
- 🔨 Release of my [Personal Website - Jayanth Kumar](https://jaykmr.com)✨ 🚀
- 🔨 Set up of the blog - [Technopreneurial Treatises](https://blog.jaykmr.com)✨ 🖊️


<details markdown=1><summary markdown="span"><b>Click here for archived news</b></summary>
* <sub> March 2024: I secured AIR 86 in GATE 2024 for Data Science and Artificial Intelligence (DA), scoring 794 marks. </sub>
* <sub> January 2023: I currently, work for Twitch TQ team in Amazon. </sub>
* <sub>  April 2022: I have joined Amazon.</sub>
* <sub>  December 2019: I secured AIR 13 in UGC NTA NET in Computer Science and Applications paper, scoring 190 marks out of 300 with percentile of 99.9719978., thus qualifying for Assistant Professor Position.</sub>


  <!-- <sub>  Feb 2020: I will be presenting a talk on "*Modelling excitation energy transfer and trapping in the filamentous cyanobacterium Anabaena variabilis PCC7120* at, "*Optimization of light energy conversion in plants and microalgae*", conference, Porto, Portugal.</sub> -->

</details>

----------
<script src="https://platform.linkedin.com/badges/js/profile.js" async defer type="text/javascript"></script>
----------
<a class="twitter-timeline" data-width="600" data-height="1000" data-dnt="true" data-theme="light" href="https://twitter.com/jayanth_kmr?ref_src=twsrc%5Etfw">Tweets by Jayanth Kumar</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8" ></script>
<a href="https://twitter.com/jayanth_kmr?ref_src=twsrc%5Etfw" class="twitter-follow-button" data-show-count="true">Follow @jayanth_kmr</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

----------

<section id="main" class="wrapper style1">

  <header class="major">
      <h2>Latest Blog Posts </h2>
  </header>

{% for e in site.medium_posts %}

<div class="row">
  <h3><a href="{{ e.link }}">{{ e.title }}</a></h3>
  <p>{{e.excerpt}}

  <section class="special">
  <a href="{{ e.link }}" style="color:black">Read More...</a>
  </section>
  Published on {{ e.date }}
  </p>
  {% endfor %}
</div>

<!-- ---------- -->

<!-- <section id="main" class="wrapper style1">

  <header class="major">
      <h2>Latest Blog Posts </h2>
  </header>
  
<script type="text/javascript">
const RSS_URL = "https://cors-anywhere.herokuapp.com/https://medium.com/feed/technopreneurial-treatises";


fetch(RSS_URL)
  .then(response => response.text())
  .then(str => new window.DOMParser().parseFromString(str, "text/xml"))
  .then(data => {
    console.log(data);
    const items = data.querySelectorAll("item");
    let html = ``;
    items.forEach(el => {
      html += `

        <div class="row">
          <h3><a href="${el.querySelector("link").innerHTML}">${el.querySelector("title").textContent}</a></h3>
          <p>{{e.excerpt}}

          <section class="special">
          <a href="${el.querySelector("link").innerHTML}" style="color:black">Read More...</a>
          </section>
          Published on ${el.querySelector("pubDate").innerHTML}
          </p>
        </div>
      `;
    });
    mainSection = document.querySelector('#main.wrapper.style1');
    mainSection.insertAdjacentHTML("beforeend", html);
  });
</script>

</section> -->
