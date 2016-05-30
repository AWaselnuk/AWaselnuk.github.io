---
layout: post
title: "Understanding the Elm type system"
date: 2016-05-27 07:00:00
categories: elm
tags:
  - functional programming
  - elm
  - types
  - static types
readings:
  - title: "Types chapter in the Elm guide"
    author: "Elm lang org"
    url: "http://guide.elm-lang.org/types/"
  - title: "Professor Frisby's Mostly Adequate Guide to Functional Programming: Chapter 4 - Currying"
    author: "Brian Lonsdorf (dr boolean)"
    url: "https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch4.html"
  - title: "Partial Function Application for Humans"
    author: "Andrew Berls"
    url: "http://andrewberls.com/blog/post/partial-function-application-for-humans"
---

The Elm programming language offers the best of functional programming in the browser. Elm was my introduction to using a static, strong type system. Adjusting to using types wasn’t easy at first, but as I continue to explore Elm I find that my programming style is changing for the better.

I want to share a quick synopsis of the Elm type system, and clarify the syntax for anyone who is getting started with Elm. I will link to several resources that helped me along the way and talk about how I think using this type system has improved my programming style.

## Embrace static typing

Getting started with static typing can be difficult. Everything seems to go a little bit slower and take a little more effort before you see results. But don't worry about it! You will find that Elm has a very approachable syntax for working with types and that using them will improve the reliability and clarity of your progams.

To clarify, one goal of a type system is to prevent any kind of error related to data types. For example, if you pass an integer to a function that expects an array, your program may explode or behave in an unexpected way. Avoiding these type related errors provides a high level of confidence that your program will work as expected. Having a type system minimizes the amount of time you will spend debugging them and increases your confidence that your customers will never see them.

**Static typing** means that the actual source code (the text file) of your Elm program is verified by a compiler. The compiler looks for type related errors and, if it finds one, it tells you loud and clear that there is a problem and refuses to build the program.

These errors at compile time provide a high level of type safety (i.e. less type related bugs) which you can refer to as **strong typing**. Because Elm has **strong, static type system**, virtually all type errors are caught by the compiler before the program is ever run in a browser. This is why Elm can boast that it has "no runtime exceptions".

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

The type annotation for `connectWords` is telling us that `connectWords` is a function that accepts two strings and returns a string. If we look at the function we see that it indeed takes two parameters, `firstWord` and `secondWord`, and concatenates them. Here is an example of a more complicated type annotation:

<div>
{% highlight haskell %}
map : (a -> b) -> List a -> List b
{% endhighlight %}
</div>

There are two things that stand out in this example: the use of parentheses, and the values `a` and `b`. The parentheses work the same way they work in math. In other words, they provide an order of operations for the compiler. What that means is that `(a -> b)` can be thought of as a complete function which accepts a value of type `a` and returns a value of type `b`. With that grouping we can read this type annotation as:

`map` is a function that accepts a function and a `List` and returns a `List`

`a` and `b` are what's known as *type variables*. They are placeholders for any type. So in this example, a function that accepts a value of type `a` really means a function that accepts a value of *any* type. The important thing is that type `a` stays the same and type `b` stays the same. Here are some possiblities for the `map` function:

<div>
{% highlight haskell %}
-- accepts:
-- a function which accepts an Int and returns a String
-- a List of Integers
-- returns:
-- a List of Strings
map : (Int -> String) -> List Int -> List String

-- accepts:
-- a function which accepts a String and returns a Bool
-- a List of Strings
-- returns:
-- a List of Booleans
map : (Int -> Bool) -> List Int -> List Bool
{% endhighlight %}
</div>

Here is an example that would violate the type annotation (think of it as the *contract*) for the `map` function:

<div>
{% highlight haskell %}
-- map : (a -> b) -> List a -> List b
map : (Int -> String) -> List Int -> List Int
{% endhighlight %}
</div>

This situation would never happen because the type variable `b` is not matching. If `map` received a function that accepted Integers and returned Strings as its first argument, we have a guarantee that it will always return a List of Strings.

Tip: Look at type annotations in the [Elm docs](http://package.elm-lang.org/packages/elm-lang/core) as you learn. At first they will seem strange but you will quickly develop a feel for them and before long you will find yourself looking at the type annotations and not even looking at the details of the function!

## Understand partial function application

A big gotcha for me was understanding the `->` syntax. How can a function that accepts two arguments possibly have a type annotation like this?

<div>
{% highlight haskell %}
connectWords : String -> String -> String
{% endhighlight %}
</div>

The key to understanding is to realize that every function is Elm is *curried* by default. You may sometimes hear this idea referred to as *partial application*. The two concepts are closely related but not exactly the same thing.

Partial application means that you can pass any number of arguments on the left side of an arrow and receive the right side of the arrow. So if I have a type annotation of `a -> b -> c`, I can pass `a` into the function and it will return a function `b -> c`. Or I can pass `a` and `b` into the function and it will return the value `c`.
[Professor Frisby's Mostly Adequate Guide to Functional Programming](https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch4.html) describes it as follows: "You can call a function with fewer arguments than it expects. It returns a function that takes the remaining arguments."

What helped me a lot here was to read up on the concept of partial function application. I found the article [Function Application for Humans](http://andrewberls.com/blog/post/partial-function-application-for-humans) extremely helpful. To explore it from a JavaScript perspective, I recommend reading [Chapter 4 of the Mostly Adequate Guide](https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch4.html).

## Unlock the power of defining types

Let's look at some more practical examples of how powerful the Elm type system can be. Elm has a data type called *records* which are very similar to JavaScript objects. The type system allows you to ask for a certain thing to exist in a record.

<div>
{% highlight haskell %}
sendEmail : { record | email : String } -> Bool
sendEmail userOrSomethingEmailable =
  -- code that sends email ...
{% endhighlight %}
</div>

This type annotation requires that we pass a record to the function that contains an email which must be a string. The rest of the fields in the record can be anything at all! This allows us to have a strong contract for this function but provides flexibility around the thing we pass into it.

### Type aliases help you model the problem

Type aliases allow you to attach human readable names to existing types. This helps you model your problem and reason about how data flows through your program. A simple example is:

<div>
{% highlight haskell %}
type alias Email = String
{% endhighlight %}
</div>

With this type alias in place, we can rewrite the above type annotation as follows:

<div>
{% highlight haskell %}
sendEmail : { record | email : Email } -> Bool
{% endhighlight %}
</div>

This becomes a very powerful tool when applied to records as it allows you to define your core models for your view. Consider the following example:

<div>
{% highlight haskell %}
type alias User =
  { name : String
  , email : Email
  , age : Int
  , admin : Bool
  }

userView : User -> Html
userView user =
  -- code that renders a view for user ...
{% endhighlight %}
</div>

Using a type alias we can describe the exact shape of what a user record should be. Our Elm app won't compile if a user record is missing one of these entries, has an extra entry, or an entry is not the correct type. This ensures that any bugs are caught long before a customer ever sees them.

As you program in Elm, you follow a delicious breadcrumb trail of extremely readable compiler error messages until the program compiles and everything works. By leveraging the type system in Elm, you account for all scenarios before you even open a browser. You never open the JavaScript console.

For example, when writing an Elm program I might at some point decide that users should have an admin flag. I will then try to use that flag in a function at which point the compiler will tell me that I have failed to add it to the User model. I will add it to the model at which point the compiler will tell me that I have failed to account for it in my main update function.

You really have to try Elm yourself to get a feel for the power of this idea and the way it guides your programming style.

### Tagged unions support the architecture

With tagged unions, you can define a type that represents the possibility of multiple types. This is one of the key features that supports the Elm architecture. A tagged union will typically be paired with a case statement to build out a function that offers multiple paths through which your program can update. The name sounds strange but the code is simple, and the type system will support you every step of the way. Here is an example:

<div>
{% highlight haskell %}
type User = SuperAdmin | Admin | Basic

userPhoto : User -> String
userPhoto user =
  case user of
    SuperAdmin ->
      "thassa.png"

    Admin ->
      "jace.png"

    Basic ->
      "merfolk.png"
{% endhighlight %}
</div>

This basic example only scratches the surface of how helpful these types can be. The Elm compiler is there to guide you towards accounting for every scenario so that your customers won't encounter errors at runtime. Watch what happens when you remove one of the branches from the case statment and try to compile:

<div>
{% highlight haskell %}
type User = SuperAdmin | Admin | Basic

userPhoto : User -> String
userPhoto user =
  case user of
    Admin ->
      "jace.png"

    Basic ->
      "merfolk.png"
{% endhighlight %}
</div>


<figure>
  <img alt="The Elm compiler highlighting a type error" src="/img/posts/elm-compiler-case-branch-error.png">
  <figcaption>The Elm compiler notices when you don't account for all cases.</figcaption>
</figure>

Imagine the power of this when you are working on a code base with multiple modules, or multiple programmers, or when you haven't looked at the code in a while. Tagged unions are outlined in greater detail in the [Elm docs](http://elm-lang.org/guide/model-the-problem).

## Try Elm today

By paying attention to Type annotations and understanding their syntax, you will write programs that are reliable, scalable, and easy to understand. When you hit tough spots while learning, don’t be shy about exploring functional programming concepts (like partial application and currying) to help unlock the bigger picture behind Elm’s design.

You should explore the [Elm Todo MVC](https://github.com/evancz/elm-todomvc) example sometime this week to see how the type system works in a real app. Don’t be afraid to break it … Elm types have got your back!

{% include further_reading.html %}
