---
layout: post
title: "Studying Functional Programming in 2015: A retrospective"
date: 2016-01-12 10:00:00
categories: miscellaneous
tags:
  - functional programming
  - learn
  - elm
  - elixir
  - haskell
readings:
  - title: What is Functional Progamming?
    author: Kris Jenkins
    url: "http://blog.jenkster.com/2015/12/what-is-functional-programming.html"
  - title: "Make the Back-End Team Jealous: Elm in Production"
    author: Richard Feldman
    url: "https://www.youtube.com/watch?v=FV0DXNB94NE&list=PLHEGna7kujw6XzsZrqyGZrXZSHedlt3rX"
  - title: Learn you a Haskell for Great Good!
    author: Miran Lipovaca
    url: "http://learnyouahaskell.com"
  - title: "Professor Frisby's Mostly Adequate Guide to Functional Programming"
    author: "Brian Lonsdorf (dr boolean)"
    url: "https://drboolean.gitbooks.io/mostly-adequate-guide/content/"
  - title: Hardcore Functional Programming in JavaScript
    author: Brian Lonsdorf and Joe Nelson
    url: "https://frontendmasters.com/courses/functional-javascript/"
  - title: Elixir Programming Language
    url: "http://elixir-lang.org/"
  - title: Elm Programming Language
    url: "http://elm-lang.org/"
---

In this post I discuss my exploration of functional programming in 2015 and walk through some of the basic ideas using JavaScript for code examples. Skip to the bottom for a huge list of interesting links!

## Background

In late 2014, I noticed a trend in the front end developer community: there was talk of this magic power called functional reactive programming. As it goes, I started sensing enough of a buzz that I became curious. One of the catalysts that really spiked my interest in the topic was [this talk](https://www.youtube.com/watch?v=gawmdhCNy-A) from Jafar Husain at Netflix. Functional and functional reactive programming sounded intriguing and they seemed to have really interesting applications for user interface design.

I was really looking to grow as a programmer so in early 2015 I decided to learn a new programming language. I wanted it to be a functional one and I settled on Elixir because it seemed to take a lot of inspiration from Ruby which I know and love. Elixir excels at building distributed, fault tolerant servers. This put me in a situation where I was tackling 3 big things: a new programming paradigm, a new language, and a new problem space. It went badly.

Elixir was a delight. I learned a lot going through some basics but my pace was at a crawl. I was trying to squeeze too much into too little time. In the summer of 2015 I decided to try a different approach so I switched to learning Elm. Elm excels at building user interfaces which is a problem space I am quite familiar with. This brought me down to 2 big things: a new programming paradigm, and a new language.

Elm has been a lot of fun but still a big challenge and a great opportunity for growth. I continue to learn it and am working productively towards building a non trivial thing with it. I plan to write some more focused blog posts about Elm soon.

There was still a ton to understand about functional programming as a concept. Studying Elm was helping but I craved more. So just before Christmas I took a [Front End Masters course called “Hardcore Functional Progamming in JavaScript”](https://frontendmasters.com/courses/functional-javascript/). Beyond having a title that made me feel like a badass, the course allowed me to leverage my knowledge of JavaScript and narrow my focus down to one thing: the functional programming paradigm.

For the rest of this article I will talk about what I believe functional programming is all about, some of the concepts covered in that course, and my next steps for learning functional programming.

## What is Functional Programming?

So far, the best description I have found is in this blog post: [What is Functional Progamming?](http://blog.jenkster.com/2015/12/what-is-functional-programming.html). The blog post describes a **functional programming language** as “[a language] that supports and encourages programming without side effects”. The essence of programming in a functional style is learning to identify side effects and then using various tools or programming patterns to ruthlessly eliminate them. In cases where you need to have an effect (for example making an http request), you use the patterns to strictly corral those cases into a few well defined places in your program.

## Side Effects and Pure Functions

A side effect is when a function affects the world outside of itself. A pure function is a function that always reacts the same way to the same inputs without causing side effects. A pure function will always return the same result for the same inputs in any context.

Pure functions also come along with some useful properties. If a function doesn't fit any one of these properties it probably is not a pure a function. Pure functions are:

* **Testable** - They are easy to test without creating mocks or fixtures.
* **Portable** - They can be used in any context and still behave the way you expect them to.
* **Memoizable** - They can be [memoized](http://www.sitepoint.com/implementing-memoization-in-javascript/).
* **Parallelizable** - They can be run in parallel without causing mischief.

### Examples

Let's look at a couple of javascript functions and see if they can be considered pure.

<div>
{% highlight javascript %}
function handleErrors ($form) {
  let $submitButton = $form.find('.submit-button');
  $submitButton.prop('disabled', false);

  // ... print error messages
}
{% endhighlight %}
</div>

This function:

* Would need a fixture in order to test it.
* Can't guarantee the same result if it was run in a different context.

Basically any DOM mutation is a side effect. This function is not pure.

<div>
{% highlight javascript %}
function logger (message, console) {
  console.log(message);
}
{% endhighlight %}
</div>

This function is not parallelizable. If you ran it across multiple threads you would not be able to guarantee the sequence of the logs. Logging to the console here is a side effect. This function is not pure.

<div>
{% highlight javascript %}
function pluralize (pluralDictionary, quantity, word) {
  if (quantity == 1) {
    return word;
  }

  return pluralDictionary[word] ||
    word + 's';
}
{% endhighlight %}
</div>

This function will always return the same result when given the same inputs. Note that if the dictionary had *not* been passed in we wouldn't be able to guarantee that. Since we did pass in the dictionary this function is pure.

## Avoiding Side Effects

Avoiding side effects is the main mission of functional programming. Languages like Elm or Haskell give you a bunch of tools that help you avoid them. You can set a JavaScript program up for functional style programming but it requires a bunch of supporting libraries. It does not really give you too many functional programming tools out of the box.

An interesting pattern that emerges when programming in this style is that all of the effects you actually want to happen (i.e. user input, printing out messages, making HTTP requests) get pushed to a few controlled boundaries in your program while the bulk of your program remains completely pure.

Let's take a look at some of the tools.

### Currying

Currying is a tool that let's you pass arguments to a function one at a time. The function returns a new function until it has been given all of it's arguments at which point it returns a result. This is much easier to explain through examples.

<div>
{% highlight javascript %}
// from: https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch4.html

// Here is a function that is curried
let add = function (x) {
  return function (y) {
    return x + y;
  };
};

let increment = add(1);
let addTen = add(10);

increment(2);
// 3

addTen(2);
// 12

// This is a helper function that can give any function the currying magic.
let curry = require('lodash.curry');

let match = curry((what, str) => str.match(what));

let hasSpaces = match(/\s+/g);
// function (x) { return x.match(/\s+/g) }
{% endhighlight %}
</div>

Notice that when creating curried functions, you should always put the data to operate on as the last function parameter.

### Function Composition

Function composition let's you build up more elaborate functions from a collection of existing simple functions. The coolest part of this technique is that it let's you create a sort of pipeline of operations that will act on your data. This pipeline is set up in a way that is incredibly easy to change.

<div>
{% highlight javascript %}
// from: https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch5.html

let toUpperCase = (x) => x.toUpperCase();
let exclaim = (x) => x + '!';
let duplicate = (x) => x + ' ' + x;

let shout = compose(exclaim, toUpperCase);
shout("send in the clowns");
// "SEND IN THE CLOWNS!"

let shoutTwice = compose(duplicate, shout);
shoutTwice("huzzah");
// "HUZZAH! HUZZAH!"
{% endhighlight %}
</div>

In the examples, `compose` is a function that creates the pipeline. The pipeline sends the data through the functions from the rightmost function to the left.

Notice how easy it was to add to the pipeline and create `shoutTwice`? Reconfiguring the composed functions becomes trivial once you have your basic functions set up. Cool stuff!

### Monads

Monads are yet another magical item used in the quest to eliminate side effects. Going through the details would make this already long article ridiculously long so I will just briefly mention them as one of the cornerstones of the functional programming style.

Monads are a construct that have to follow a bunch of rules but they are essentially containers around data. You access the data by *mapping* over the container, otherwise you work with the container when doing function composition and building up your program. There are a whole bunch of different Monads that give you various magical powers. I urge you to read [Chapter 8 of the Mostly Adequate Guide](https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch8.html) if you want to learn more about them.

### Example Apps

Here is an example app written in JavaScript using the functional style. There may be a ton of unfamiliar things in there but the key thing to notice is that all of the side effects exist only at the edges of the program. [Functional JS app](https://github.com/begriffs/immutube/blob/master/scripts/app.js)

## Next Steps

At this point I am just beginning to understand why this style of programming would be a benefit. With more practice, I hope to move towards a place where I really *feel* the advantages.

Although I don't follow the functional style in my daily work, some of the ideas have started to stick and are influencing the way I write code. I am starting to really notice hidden inputs and side effects. Whenever possible I take steps to make them more explicit even if I can't figure out how to eliminate them.

The goal all along has been to learn and practice a style of programming that would challenge my existing understanding and push me into new and exciting territory so that I will grow as a programmer. With that in mind, I would say that my exploration of functional programming has been a resounding success.

## Thanks

I want to give special thanks to [Joe Nelson](https://twitter.com/begriffs) and [Brian Lonsdorf](https://twitter.com/drboolean) who did an amazing job of unpacking these ideas in the [Front End Masters course](https://frontendmasters.com/courses/functional-javascript/). Brian has also created an amazing online book called "Professor Frisby's Mostly Adequate Guide to Functional Programming". Check it out!

{% include further_reading.html %}


