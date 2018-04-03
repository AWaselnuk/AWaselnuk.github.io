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
  <pre><code class="javascript">
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
  <pre><code class="javascript">
    class EmailForm {
      render() { ... }

      submit() { ... }

      validate() { ... }

      trackUserDataWithoutConsent() { ... }
    }
  </code></pre>
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
  <pre><code class="javascript">
    function printReport(report) {
      // our printer can't handle emojis so we need to remove them
      report = report.replace(/!&!(%^%^#*)/g, '');
      console.log(report);
    }
  </code></pre>

  <pre><code class="javascript">
    function printReport(report) {
      console.log(prepareForPrint(report));
    }

    function prepareForPrint(printable) {
      const BLACKLIST = /!&!(%^%^#*)/g;
      return printable.replace(BLACKLIST, '');
    }
  </code></pre>

  <p><small>* note that my made up regex might not work as advertised</small></p>
</section>

<section data-background-color="#ffc043">
  TODO: link to final GH file
  <p>Consider this real world example.</p>
</section>

<section>
  <h2>Dependencies</h2>

  <aside class="notes" data-markdown>
    * Not the kind you 'import'
    * The kind that means when you change one class you have to go change another one
  </aside>
</section>

<section>
  <p>Recognition is your most important first step! An object has a dependency when it knows:</p>
  <ul>
    <li>The name of another class</li>
    <li>The name of a message it intends to send to someone other than <code>this</code>.</li>
    <li>Arguments that a message requires.</li>
    <li>The order of arguments that a message requires.</li>
  </ul>
</section>

<section>
  <pre><code class="javascript">
    import Turkey from './Turkey.js';
    import Soup from './Soup.js';

    class Dinner {
      serve() {
        Turkey.serve();
        Soup.serve(3, true); // 3 bowls with garnish added
      }
    }
  </code></pre>

  <aside class="notes" data-markdown>
    * Knows the names of Turkey and Soup
    * Knows that they accept a message called 'serve'
    * Knows that Soup.serve accepts a number and then a boolean
    * Knows that Soup.serve needs the number first
  </aside>
</section>
