---
layout: post
title:  "10 things I learned in my transition from web designer to developer"
date:   2015-01-28 18:00:00
categories: miscellaneous
tags: oodesign design programming ruby
cover: "img/console.gif"
readings:
  - title: Practical Object Oriented Design in Ruby
    author: Sandi Metz
    url: "//www.poodr.com/"
  - title: Code Complete
    author: Steve McConnell
    url: "//www.amazon.ca/Code-Complete-Edition-Steve-McConnell/dp/0735619670"
---

I started my career in the web industry as a web designer. I was totally in love with HTML and CSS and could write some really basic JavaScript. I spent most of my time thinking about the visual design of a webpage.

Over time, I became more and more interested in development. I started to think less about the visual design and more about the design of the code that makes up modern web applications. Eventually I learned Ruby on Rails and was hooked.

Today, I consider myself a Front End Developer: technically minded with a solid understanding of the full stack and an eye for UI design.

Here are 10 things I learned during my transition from web designer to developer.

## 1. Error handling is an art

As a web designer, errors mean one thing: your design does not render well. In many cases this is not a do or die situation. You either fix the problem or mark it off as acceptable and move on. As you start to program more you realize that error handling is not so simple. You have to think about errors at a more granular level. Is this error going to cause the system to collapse? Is this error acceptable under certain circumstances but not others? How can I form a consistent strategy for handling errors that doesn't weave a tangled web of chaos?

## 2. You can use your aesthetic sense in the code you write

Computers don't care what your code looks like, but your colleagues do. Just because you are writing code now doesn't mean you stop thinking about style. Look into coding style guides, and linters. Learn by example then evolve your own style. Use your consensus building skills to sell that style to your team.

## 3. Let the computer do what it's good at

When I first started out I would do so much programming by hand. In photoshop everything is done with a mouse. You are constantly copying and pasting. These habits naturally carried over.

This is a bad idea.

When you find yourself copy pasting a lot of code just stop. Ask yourself: "How can I make the computer do this for me?". There is almost always a way.

Look into build tools (Grunt, Gulp, etc.) to streamline your workflow. Repetitive tasks are the job of the computer.

## 4. Break things down into small components

As a designer, your aesthetic sense demands that you see the whole picture. You might tend to look at your UI designs as a whole. This is just fine, but as you start to program more you must learn to see everything as a component. You are designing systems not interactive images.

Luckily the responsive web design movement has already taught many people this lesson.

## 5. Don't overdesign

This is somewhat related to the last point. 'Pixel perfect' just does not translate well.
When it comes to coding, designing just enough is the key. Unfortunately the only way you will figure out how much is just enough is with a ton of practice.

## 6. You still get to design interfaces

Interfaces are my favourite thing! When you write a new class or method or dohickey, what do you want to go in and what do you want to come out? How does that work with your other components? How do you want that to feel?

## 7. Design for messages

This is an Object Oriented way of thinking. To sum it up: who cares what a thing is? All that matters is what can that thing respond to. Ruby does this amazingly well:

<div>
{% highlight ruby linenos %}

'adam'.nil?
# => false

nil.nil?
# => true

{% endhighlight %}
</div>

Even a nil value responds to the message .nil? This is by design.

## 8. Understand any third party code you are using

You don't need to know every little internal detail, but you should generally understand the code you are using. It seems obvious but this has come back to bite me so many times. I'll end up with multiple tools doing the same thing which creates extra overhead, inconsistent design, and headaches for people reading it. Or even worse, I'll use a tool in an unintended way and get strange bugs that take a while to figure out.

So much pain can be saved by just spending the extra 20 minutes to read the basic documentation.

## 9. Understand the languages you use

For a while I would just find the needed code snippets and paste them in. They would give me the effect I wanted. But what happens when you want to change something? All it takes is about 10 to 20 minutes to research the snippet you are investigating. Do this consistenly and before you know it you will be very comfortable with the languages you are using.

In addition, you avoid using libraries that offer features your language already provides.

## 10. Don't be self-conscious about your code. Show it to people!

This can be daunting, but it is essential that you conquer your shyness when it comes to sharing code. There is no faster way to learn!

{% include further_reading.html %}


