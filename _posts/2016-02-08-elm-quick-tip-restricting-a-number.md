---
layout: post
title: "Elm quick tip: restricting a number"
date: 2016-02-08 10:00:00
categories: elm
tags:
  - functional programming
  - elm
readings:
  - title: What is Functional Progamming?
    author: Kris Jenkins
    url: "http://blog.jenkster.com/2015/12/what-is-functional-programming.html"
---

Here is a quick tip for restricting a number in Elm. I came across an interesting function in the standard library while building a form with some number inputs. I wanted to keep the numbers entered by the user restricted to a known range. Consider the following code:

<div>
{% highlight haskell %}
-- UPDATE
update action model =
  case action of
    ModifyLevel level ->
      ({ model | level = restrictLevel level }, Effects.none)

-- VIEW
input
  [
    class "character-level"
  , type' "number"
  , value (toString character.level)
  , on "input" targetValue (\level -> Signal.message context.actions (ModifyLevel (safeStrToLevel level)))
  ] []
{% endhighlight %}
</div>

In this example, whenever the user types a level into the character-level input, the program sends a message tagged with the `ModifyLevel` action and the level to the `update` function. The program restricts the level by calling `restrictLevel` on the data passed to the `update` function.

Here is my original, long-winded `restrictLevel` function:

<div>
{% highlight haskell %}
restrictLevel : Int -> Int
restrictLevel level =
  if level < 1 then
    1
  else if level > 20 then
    20
  else
    level
{% endhighlight %}
</div>

This effectively prevents the user from typing in a number outside of the range 1 to 20. It turns out the Elm standard library has a function for this exact situation which can save you quite a bit of typing. The function is called `clamp` ([read about it on the Elm docs](http://package.elm-lang.org/packages/elm-lang/core/3.0.0/Basics#clamp))\*. Here is my refactored `restrictLevel` function:

<div>
{% highlight haskell %}
restrictLevel : Int -> Int
restrictLevel level =
  clamp 1 20 level
{% endhighlight %}
</div>

<small>\*Note that at the time of this writing, I was using Elm core v3.0.0</small>

{% include further_reading.html %}
