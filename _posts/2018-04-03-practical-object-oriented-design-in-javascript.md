---
layout: presentation
title: "Practical Object-Oriented Design in JavaScript"
categories: presentations
tags: presentations javascript oop design
---

<section>
  <h2>Practical Object-Oriented Design in JavaScript</h2>
  <p>
    Adam Waselnuk (<a href="https://twitter.com/AWaselnuk">@AWaselnuk</a>)
    <br>
    Technical Lead at <a href="https://www.shopify.com/careers">Shopify</a>
  </p>
</section>

<section>
  <p>Who here has seen something like this before?</p>

  <pre><code class="javascript" data-trim>
    class Animal {
      constructor(name) {
        this.name = name;
      }

      speak() {
        console.log(`I am ${this.name}.`);
      }
    }

    class Cat extends Animal {
      speak() {
        console.log(`I like to meow and poop on your bed.`);
      }
    }
  </code></pre>

  <aside class="notes" data-markdown>
    * This is what I found when I started looking into OOP.
    * Tell the story of why I started looking into OOP during my first real job. Mention Sandi Metz and POODR.
    * I am frustrated that the real value does not seem to get talked about in JS community. I am here today to start fixing that.
  </aside>
</section>

<section>
  <h2>Object-Oriented <mark>Design</mark></h2>
  <p><i>“The goal of design is to arrange your software so that it does what it is supposed to right now and is also easy to change later.</i></p>

  <p><i>Creating this quality of easy changeability reveals the craft of programming.” - Sandi Metz</i></p>

  <aside class="notes" data-markdown>
    * When I started out I was only good at the first part (make it work).
    * OOP gave me tools to start working on the next part.
  </aside>
</section>

<section>
  <h2><mark>Object-Oriented</mark> Design</h2>
  <p>This is a bad name.</p>

  <p><i>“I'm sorry that I long ago coined the term 'objects' for this topic because it gets many people to focus on the lesser idea.” - Alan Kay</i></p>

  <aside class="notes" data-markdown>
    * Objects are the most obvious thing and it's where discussion gets focused.
    * What we actually want to arrange around are messages. A message is a bit of data or behaviour you want. In JS we often refer to these as functions or methods.
  </aside>
</section>


<section>
  <pre><code>
    cat         // object
      .speak()  // message
  </code></pre>
</section>

<section>
  <p><i>“You don’t send messages because you have objects, you have objects because you send messages”</i></p>
  <p><i>- Sandi Metz</i></p>

  <aside class="notes" data-markdown>
   * The messages being passed around are your actual, living, breathing application
   * The conversation between objects happens through their interfaces, so the way you craft those is of the utmost importance.
   * When you focus on the messages you want to send, you can discover the objects you will need
   * Probably should have called it Message-Oriented Design
  </aside>
</section>

<section>
  <h2>Some concepts</h2>

  <ol>
    <li>Single Responsibility Principle</li>
    <li>Dependencies</li>
    <li>Interfaces</li>
  </ol>
</section>

<section data-background-color="#ffc043">
  <h2>WARNING!!</h2>

  <p><b>Production code ahead.</b></p>

  <p><b>Ish might get <i>real</i>.</b></p>
</section>

<section>
  <h2>Single Responsibility Principle</h2>

  <aside class="notes" data-markdown>
    * It pushes you towards changeability. Lego blocks and such.
    * A better name might be Single Changeability principle.
  </aside>
</section>

<section>
  <h2>SRP - Classes</h2>

  <ul>
    <li>Pretend it is a person and ask it questions</li>
    <li>A better name might be Single Changeability principle</li>
  </ul>
</section>

<section>
  TODO: code a class and talk to it
</section>

<section>
  <h2>SRP - Methods and Functions</h2>

  <ul>
    <li>SRP is <b>fractal</b></li>
    <li>Make implicit things explicit and avoid the need for comments</li>
    <li>Encourage reuse</li>
    <li>Easy to move around to other classes</li>
  </ul>
</section>

<section>
  TODO: code methods to illustrate
</section>

<section data-background-color="#ffc043">
  TODO: link to final GH file
  <p>Consider this real world example.</p>
</section>
