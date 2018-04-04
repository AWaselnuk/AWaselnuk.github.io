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
  <pre><code class="javascript" data-trim>
    class EmailForm {
      // Mr. EmailForm how do you look in the DOM?
      // Pretty good thanks
      render() { ... }
      // Mr. EmailForm can you please submit yourself?
      // Yep.
      submit() { ... }
      // Mr. EmailForm can you validate something?
      // Hmm, maybe. Depends what I'm validating.
      validate() { ... }
      // Mr. EmailForm can you please track everything?
      // Maybe not, ask Mr. Tracky
      trackUserDataWithoutConsent() { ... }
    }
  </code></pre>
</section>

<section>
  <h2>SRP - Methods and Functions</h2>

  <ul>
    <li>SRP is <b>fractal</b>. Try it on methods too!</li>
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

  <aside class="notes" data-markdown>
    * Make sure to tie back to SRP
    * Make sure to tie back to focusing on messages
  </aside>
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
    <li>The name of a message it intends to send to someone other than <code>this</code></li>
    <li>Arguments that a message requires</li>
    <li>The order of arguments that a message requires</li>
  </ul>
</section>

<section>
  <pre><code class="javascript">
    import Turkey from './Turkey.js';
    import Soup from './Soup.js';

    class Dinner {
      serve() {
        new Turkey().serve();
        new Soup().serve(3, true); // 3 scoops with garnish
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

<section>
  <h2>Dependency Injection</h2>

  <ul>
    <li>Helps you not know the name of a class you depend on</li>
    <li>Makes things very highly decoupled and therefore, much easier to test</li>
    <li>Opens up the possibility of <a href="http://cek.io/blog/2014/05/02/poodr-ch-5/">duck-typing</a> (not covered in this talk but POODR has a whole chapter on it or come talk to me later)</li>
  </ul>
</section>

<section>
  <h3>Dependency Injection</h3>
  <pre><code class="javascript">
    import Turkey from './Turkey.js';

    class Dinner {
      constructor(turkey) {
        this.turkey = turkey;
      }

      serve() {
        this.turkey.serve();
      }
    }
  </code></pre>
</section>

<section>
  <h2>Isolate dependencies</h2>

  <ul>
    <li>Constraints or convenience might make it unpractical to remove dependencies</li>
    <li>Put a useful barrier around your class' dependencies that makes them easy to spot</li>
    <li>Make it easy to recognize and remove should that moment ever arrive</li>
  </ul>
</section>

<section>
  <h3>Isolate dependencies</h3>
  <pre><code class="javascript">
    import Turkey from './Turkey.js';

    class Dinner {
      serve() {
        this.turkey.serve();
      }

      // Isolate the evil invader
      get turkey() {
        this.turkeyCache = this.turkeyCache || new Turkey();
        return this.turkeyCache;
      }
    }
  </code></pre>

  <aside class="notes" data-markdown>
    * This may look crazy but the payoff happens at scale. Imagine those big crazy files you have in production in large codebases.
  </aside>
</section>

<section>
  <h3>Use named arguments</h3>

  <ul>
    <li>Remove order dependencies</li>
    <li>Leave a really nice label for programmers</li>
    <li>Keep in mind we mostly read code</li>
  </ul>
</section>

<section>
  <h3>Use named arguments</h3>

  <pre><code class="javascript">
    // Dependency madness
    soup.serve(3, true) // 3 scoops with garnish added
  </code></pre>

  <pre><code class="javascript">
    // So clear
    soup.serve({scoops: 3, withGarnish: true})
  </code></pre>

  <pre><code class="javascript">
    // Might be cool?
    soup.serve({scoops: 3, extras: ['garnish']})
  </code></pre>
</section>

<section data-background-color="#ffc043">
  TODO: link to final GH file
  <p>Let's look at some real code.</p>

  <aside class="notes" data-markdown>
    * Make sure to tie back to dependencies
    * Make sure to tie back to focusing on messages
  </aside>
</section>

<section>
  <h2>Interfaces</h2>

  <aside class="notes" data-markdown>
    * The interfaces provide the conversation between objects.
    * From a message-first perspective they are of the utmost importance
    * We will focus on one key concept - the usefulness of private vs public
  </aside>
</section>

<section>
  <p><i>“Think about interfaces. Create them intentionally. It is your interfaces more than all of your tests and any of your code, that define your application and determine its future.”</i></p>

  <p><i>- Sandi, of course</i></p>
  <aside class="notes" data-markdown>
    * JavaScript has not made this easy by making it hard to be explicit
    * When you aren't explicit, classes inevitably grow into large messes with unclear boundaries or responsibilities. The code falls into the traps discussed in the previous sections. Things that change often are coupled to many other things and are too concrete.
  </aside>
</section>

<section>
  <h2>Craft explicit and flexible interfaces</h2>

  <p>Public interfaces should:</p>

  <ul>
    <li>Be explicity identified as public</li>
    <li>Be more about <i>what</i> than <i>how</i></li>
    <li>Have names that, as much as you know, won't change</li>
  </ul>
</section>

<section>
  <h3>“Private” methods in JavaScript</h3>

  <pre><code class="javascript">
    // Developers use underscores

    class Spaceship {
      // public
      fly() { ... }
      refuel() { ... }

      // private
      _calculateRemainingFuel() { ... }
      _preflightMusicCheck() { ... }
    }
  </code></pre>
</section>

<section>
  <h3>“Private” methods in JavaScript</h3>

  <pre><code class="javascript" data-trim>
    // Revealing module pattern

    const spaceship = (() => {
      const fly = () => { ... }
      const refuel = () => { ... }

      // these two functions are only available in closure
      const calculateRemainingFuel = () => { ... }
      const preflightMusicCheck = () => { ... }

      // the IIFE returns the public API
      return {
        fly,
        refuel
      };
    })();
  </code></pre>
</section>

<section>
  <h3>“Private” methods in JavaScript</h3>

  <pre><code class="javascript">
    // The future
    // https://github.com/tc39/proposal-private-methods

    class Spaceship {
      // public
      fly() { ... }
      refuel() { ... }

      // private
      #calculateRemainingFuel() { ... }
      #preflightMusicCheck() { ... }
    }
  </code></pre>
</section>

<section>
  <h2>Be more about <i>what</i> than <i>how</i></h2>

  <ul>
    <li>Size of public interface drops considerably which means less complexity and coupling.</li>
  <li>Flexibility is improved because now you can trust collaborators to evolve their internals and you don’t need to care about how they did it.</li>
  </ul>
</section>

<section>
  <p>Evolution goes from procedural to OO as trust improves:</p>
  <ol>
    <li>I know what I want and I know how you do it</li>
    <li>I know what I want and I know what you do</li>
    <li>I know what I want and I trust you to do your part</li>
  </ol>
</section>

<section>
  <h3>Improving trust</h3>

  <pre><code class="javascript" data-trim>
    import Spaceship from './Spaceship.js';

    class Astronaut {
      constructor() {
        this.spaceship = new Spaceship();
      }

      // I know what I want and I know how you do it
      goToSpaceNow() {
        if (this.spaceship.fuel < 10) {
          this.spaceship.refuel();
        }

        if (this.spaceship.flightReady) {
          this.spaceship.fly = true;
        } else (
          this.spaceship.preflightMusicCheck();
          this.spaceship.fly = true;
        )
      }
    }
  </code></pre>
</section>

<section>
  <h3>Improving trust</h3>

  <pre><code class="javascript">
    import Spaceship from './Spaceship.js';

    class Astronaut {
      constructor() {
        this.spaceship = new Spaceship();
      }

      // I know what I want and I know what you do
      goToSpaceNow() {
        this.spaceship.refuel();
        this.spaceship.preflightMusicCheck();
        this.spaceship.startEngine();
        this.spaceship.takeOff();
      }
    }
  </code></pre>
</section>

<section>
  <h3>Improving trust</h3>

  <pre><code class="javascript">
    import Spaceship from './Spaceship.js';

    class Astronaut {
      constructor() {
        this.spaceship = new Spaceship();
      }

      // I know what I want and I trust you to do your part
      // Notice the shrinking public API
      goToSpaceNow() {
        this.spaceship.fly({astronaut: this});
      }
    }
  </code></pre>
</section>

<section data-background-color="#ffc043">
  TODO: link to final GH file
  <p>One final flight to production code</p>

  <aside class="notes" data-markdown>
    * Make sure to tie back to interfaces
    * Make sure to tie back to focusing on messages
  </aside>
</section>
