---
layout: archive
permalink: /
excerpt: "Jayanth Kumar"
author_profile: true
marp: false
---
<h1> Hey 👋 there, viewers 👀! </h1>
<h2>
I am Jayanth Kumar. 
</h2>

Currently building large scale software systems as SDM III at Amazon, being one of the youngest Engineering Leader in a FAANG . I am a published poet, a technical architect, an entrepreneur, an angel investor, an engineering leader and even, an assistant professor too, basically a Polymath.

Subscribe to my website to read *System Manifesto* or read my poetry anthology - "*Gonzo Poet and through his lens*" or follow my blog - "*Technopreneurial Treatises*" for more engineering and entrepreneurial philosophical content.

 You can book a 1:1 call or ask any queries you may have on my [*topmate.io page*](https://topmate.io/jaykmr). Whether you need help with my areas of expertise or just want to chat about anything, I'm available.

See you around 🎩



<div>
  
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

- 🔨 Set up of my mentorship profile - [*topmate.io page*](https://topmate.io/jaykmr)✨ 🤝🏼
- 🔨 Added gallery of my research and work associations [Gallery - Jayanth Kumar](https://jaykmr.com/gallery/)✨ 📷
- 🔨 Release of my [Personal Website - Jayanth Kumar](https://jaykmr.com)✨ 🚀
- 🔨 Set up of the blog - [Technopreneurial Treatises](https://blog.jaykmr.com)✨ 🖊️
<!-- - Would you like to search for scientific keywords and obiatin it's related analytics from publications to authors? Here's link to one of my [*code for fun*](https://avratanubiswas.github.io/cats-and-codes/) project, a web-app, called [PubLit](https://share.streamlit.io/avratanubiswas/publit/main/publit.py) 🚀
 -->

<details markdown=1><summary markdown="span"><b>Click here for archived news</b></summary>

* <sub> January 2023: I currently, work for Twitch TQ team in Amazon. </sub>
* <sub>  April 2022: I have joined Amazon.</sub>


  <!-- <sub>  Feb 2020: I will be presenting a talk on "*Modelling excitation energy transfer and trapping in the filamentous cyanobacterium Anabaena variabilis PCC7120* at, "*Optimization of light energy conversion in plants and microalgae*", conference, Porto, Portugal.</sub> -->

</details>

----------
<a class="twitter-timeline" data-width="600" data-height="1000" data-dnt="true" data-theme="light" href="https://twitter.com/jaynkmr?ref_src=twsrc%5Etfw">Tweets by Jayanth Kumar</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8" ></script>
<a href="https://twitter.com/jaynkmr?ref_src=twsrc%5Etfw" class="twitter-follow-button" data-show-count="true">Follow @jaynkmr</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

----------

<!-- <section id="main" class="wrapper style1">

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
  </p>
  {% endfor %}
</div>
</section> -->

<!-- ---------- -->

<section id="main" class="wrapper style1">

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

</section>
