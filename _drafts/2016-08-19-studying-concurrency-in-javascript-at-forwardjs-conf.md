---
layout: post
title: "Studying concurrency in JavaScript at ForwardJS conf"
date: 2016-08-19 07:00:00
categories: miscellaneous
tags:
  - conferences
  - javascript
  - learning
readings:
  - title: "Async & Performance from You Don't Know JS"
    author: "Kyle Simpson"
    url: "https://github.com/getify/You-Dont-Know-JS/tree/master/async%20%26%20performance"
---

ForwardJS conf was a JavaScript conference held at the Regency Ballroom in San Francisco.
It was my first time attending a tech conference and my first time in San Francisco and it was magical!
The format was a mix of panel discussions and presentations, as well as full day workshops throughout the week.
I attended the Asynchronous programming in JavaScript workshop put on by Kyle Simpson (@getify) and it was majorly awesome!

## Asynchronous programming workshop

The way I learn is to focus as much as possible on first principles. This has been incredibly useful for learning about
programming because the specifics of technology (i.e. libraries, frameworks, languages) change often. By thinking mostly about the foundational patterns and truths that govern software development, I can switch around between different technical landscapes and still mostly recognize what is going on. It becomes easier to carry existing knowledge around with me.

I specialize in front end development, so recently I was thinking more about what the first principles of developing UI could be. It dawned on me that asynchronous programming is one of those things. Whatever your tech stack is, you need to understand concurrency and asynchrony. This is a confusing topic and I felt like I had a lot more to learn there.

With that context, selecting the workshop on asynchronous programming by Kyle Simpson was an obvious choice!

What I learned at this workshop could fill many, many pages so I won't write about it here.
Luckily Kyle Simpson wrote an entire chapter on it for his You Don't Know JS series.
For most of the content, refer to the chapter called [Async & Performance](https://github.com/getify/You-Dont-Know-JS/tree/master/async%20%26%20performance)

The last thing to mention is CSP (communicating sequential processes). This is a concurrent programming pattern that Kyle mentioned he was very excited about. It has been around for a long time but recently he has noticed some people he admires talking about it. I have also noticed this trend emerging because, if you are like me and don't really understand it and just squint your eyes a bit, it looks like this is what Erlang/Elixir/Go/Closure are doing and the direction that the Elm programming language [has recently moved towards](http://elm-lang.org/blog/farewell-to-frp).

I may not understand the nuances yet (someone is probably having a fit about me saying Erlang/Elixir is CSP), but I do know that I would be foolish to not dive deeper into these concepts.
