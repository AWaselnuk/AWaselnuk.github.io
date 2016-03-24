---
layout: post
title: "Understanding the Elm type system"
date: 2016-02-08 10:00:00
categories: elm
tags:
  - functional programming
  - elm
  - types
  - static types
readings:
  - title: What is Functional Progamming?
    author: Kris Jenkins
    url: "http://blog.jenkster.com/2015/12/what-is-functional-programming.html"
---

The Elm programming language offer the best of functional programming in the browser. Elm was my introduction to using a static, strong type system. Adjusting to using types wasn’t easy at first but, as I continue to explore Elm, I find that my programming style is changing for the better.

I want to share a quick synopsis of the Elm type system, and clarify the syntax for anyone who is getting started with Elm. I will link to several resources that helped me along the way and talk about how I think using this type system has improved my programming style.

## Embrace static typing

Getting started with static typing can be difficult. Everything seems to go a little bit slower and take a little more effort before you see results. But don't worry about it! You will find that Elm has a very approachable syntax for working with types and that using them will improve the reliability and clarity of your progams.

To clarify, one goal of a **type system** is to prevent any kind of error related to types. For example, if you pass an integer to function that expects an array, your program may explode or behave in an unexpected way. Avoiding these type related errors provides a high level of **type safety**.

**Static typing** means that the actual source code (the text file) of your Elm program is verified by a compiler. The compiler looks for type related errors and, if it finds one, it tells you loud and clear that there is a problem and refuses to build the program.

These errors at compile time provide a high level of **type safety** which you can refer to as **strong typing**. Because Elm has **strong, static type system**, virtually all type errors are caught by the compiler before the program is ever run in a browser. This is why Elm can boast that it has "no runtime exceptions".

<figure>
  ![The Elm compiler highlighting a type error](/img/posts/elm-compiler-type-error.png)
  <figcaption>The Elm compiler highlighting a type error</figcaption>
</figure>

## Start writing type annotations

Here is a basic type annotation in Elm:

<div>
{% highlight haskell %}
greeting : String -> String
{% endhighlight %}
</div>

Let's break this down. `:` can be read as "has type". `->` can be read as "returns". All together we can interpret this type annotation as:

`greeting` is a function that accepts a `String` and returns a `String`.



