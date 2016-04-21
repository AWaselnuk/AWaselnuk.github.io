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

I want to share a quick synopsis of the Elm type system, andas=dadads clarify the syntax for anyone who is getting started with Elm. I will link to several resources that helped me along the way and talk about how I think using this type system has improved my programming style.

## Embrace static typing

Getting started with static typing can be difficult. Everything seems to go a little bit slower and take a little more effort before you see results. But don't worry about it! You will find that Elm has a very approachable syntax for working with types and that using them will improve the reliability and clarity of your progams.

To clarify, one goal of a **type system** is to prevent any kind of error related to types. For example, if you pass an integer to function that expects an array, your program may explode or behave in an unexpected way. Avoiding these type related errors provides a high level of **type safety**.

**Static typing** means that the actual source code (the text file) of your Elm program is verified by a compiler. The compiler looks for type related errors and, if it finds one, it tells you loud and clear that there is a problem and refuses to build the program.

These errors at compile time provide a high level of **type safety** which you can refer to as **strong typing**. Because Elm has **strong, static type system**, virtually all type errors are caught by the compiler before the program is ever run in a browser. This is why Elm can boast that it has "no runtime exceptions".

<figure>
  <img alt="The Elm compiler highlighting a type error" src="/img/posts/elm-compiler-type-error.png">
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

Basically an `->` indicates a function. Here is another example:

<div>
{% highlight haskell %}
connectWords : String -> String -> String
connectWords firstWord secondWord =
  firstWord ++ secondWord
{% endhighlight %}
</div>

The type annotation for `connectWords` is telling us that `connectWords` is a function that accepts two strings and returns a string. If we look at the function we see that it indeed takes two parameters, `firstWord` and `secondWord` and concatenates them. Here is an example of a more complicated type annotation:

<div>
{% highlight haskell %}
map : (a -> b) -> List a -> List b
{% endhighlight %}
</div>

There are two things that stand out in this example; the use of parentheses, and the values `a` and `b`. The parentheses work the same way they work in math. In other words they provide an order of operations for the compiler. In this example, what that means is that `(a -> b)` can be thought of as a complete function which accepts a value of type `a` and returns a value of type `b`. With that grouping we can read this type annotation as:

`map` is a function that accepts a function and a `List` and returns a `List`

`a` and `b` are what's known as "type variables". They are placeholders for any type. So in this example, a function that accepts a value of type `a` really means a function that accepts a value of *any* type. The important thing is that type `a` stays the same and type `b` stays the same. Here are some possiblities for the `map` function:

<div>
{% highlight haskell %}
-- accept a function which accepts an Int and returns a String
-- and a List of Integers and return a List of Strings
map : (Int -> String) -> List Int -> List String

-- accept a function which accepts a String and returns a Bool
-- and a List of Strings and return a List of Booleans
map : (Int -> Bool) -> List Int -> List Bool
{% endhighlight %}
</div>

Here is an example that would violate the type annotation, or the "contract", for the `map` function:

<div>
{% highlight haskell %}
-- map : (a -> b) -> List a -> List b
map : (Int -> String) -> List Int -> List Int
{% endhighlight %}
</div>

This situation would never happen because the type variable `b` is not matching. If `map` received a function that accepted Integers and returned Strings as its first argument, we have a guarantee that it will always return a List of Strings.

Tip: Look at type annotations in the [Elm docs](http://package.elm-lang.org/packages/elm-lang/core) as you learn. At first they will seem strange but you will quickly develop a feel for them and before long you will find yourself looking at the type annotations and not even looking at the details of the function!

## Understand Partial Function Application

A big gotcha for me was understanding the `->` syntax. How can a function that accepts two arguments possibly have a type annotation like this?

<div>
{% highlight haskell %}
connectWords : String -> String -> String
{% endhighlight %}
</div>

The key to understanding is to realize that every function is Elm is *partially applied* by default. You may sometimes hear this idea referred to as *currying*. The two concepts are closely related but not exactly the same thing.

Partial application means that you can pass any number of arguments on the left side of an arrow and receive the right side of the arrow. So if I have a type annotation of `a -> b -> c`, I can pass `a` into the function and it will return a function `b -> c`. Or I can pass `a` and `b` into the function and it will return the value `c`. 
