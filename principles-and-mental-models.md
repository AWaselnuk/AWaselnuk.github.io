---
layout: default
title: Principles and Mental Models for Software Developers
description: >
  Principles and Mental Models for software developers who are interested in personal growth. These ideas have been accumulated
  over the course of my career in the tech industry working at Shopify as a web developer.
---

[back to articles](/)

# Principles and Mental Models for Software Developers

_Last updated: March 13, 2020_

As my career in the tech industry has progressed, I have tried out many different systems and ideas to continously improve myself and my craft.
Some of these tools and approaches have stayed with me and become a critical part of my success. On this page, I will be assembling my favourite ideas for quick reference. This will be a living document, updated constantly as I continue to learn, reflect, and grow.

I have divided the concepts into three sections: Principles, Mental Models, and Cookbook. You can think of the [Principles](#principles) as guides for action when faced with a problem. [Mental Models](#mental-models) are simplified models of reality that work well as lenses to apply to your thinking. [The Cookbook](#cookbook) is filled with recipes you can follow to debug problems common to developers.

## Principles

### You are bad at predicting the future

Humans are bad at predicting the future. If you don't believe this statement, I recommend diving into the book [Superforecasting][superforecasting]. To make matters worse, software projects are complicated and usually unique. Looking at past projects to predict the success or shape of the upcoming project may fail, because each project has developers discovering things for the first time. On top of that technical challenge, you are likely working with humans, and those humans will introduce additional complexities and surprises.

I recommend lightweight planning, but I do not recommend having confidence in your predictions.

### Optimize for change

The tech industry changes quickly. Projects that were important last week may suddenly get cancelled. Priorities and teams will shift. To conquer the changing landscape, do not tie your identity or happiness to your current project, but rather the skills and passion you bring to it. Assume all the code you ship is final. Aim for simplicity and cut as much as you can. Large and complicated software changes too slowly.

Write code that reveals your intentions and is easy to change. Beware of violating the [YAGNI](#yagni) principle when optimizing for change. Making code more general and adaptable makes it more complicated. Make sure you [discover abstractions instead of designing them](#discover-abstractions-instead-of-designing-them).

### Prefer fast decision making to perfect decisions

Making a perfect decision is unreasonable because the world is complicated and [you are bad at predicting the future](#you-are-bad-at-predicting-the-future). One of the best things you can do to become a better decision maker is to practice making decisions faster.

There are three points that, taken together, explain why you should make faster decisions. I will quote entirely from [Brandon Chu's fantastic article on this topic:][making-good-decisions]

> 1. The less important a decision, the less information you should try to seek to make it.
> 2. Gathering information follows a [Pareto principle](#pareto-principle), meaning you can get 80% of the information quite easily, but getting the final 20% requires a lot of effort.
> 3. Most decisions are not important

Faster decisions are almost always better decisions.

### Writing software is like writing french poetry

Software development is often referred to as "engineering". The discipline is laden with scientific concepts and approaches to thinking. This can lead to ridiculous, time wasting arguments about code quality that use an appeal to science to justify a position.

Forget all that: we are more like creative writers than scientists. Great code is all about discovering concepts, naming and revealing those concepts, and expressing yourself for a human reader to understand. Science helps but it is not the core skill in software development.

This was beautifully expressed to me by David Heinemeier Hansson in his [2014 keynote address at RailsConf.][writing-software-talk]

### YAGNI

YAGNI stands for **You Aren't Going To Need It**. It is a catchy way to remember not to write complicated software in anticipation of some future requirements that may never really appear. Remember that [you are bad at predicting the future](#you-are-bad-at-predicting-the-future).

### Discover abstractions instead of designing them

In order to avoid the dangers of [YAGNI](#yagni), you should try to avoid designing abstractions. It is much better to discover them. I use a rule of 3. Do I need some code to act a lot like some other code? Great, I'll just copy and paste! Do I need some third thing to act a lot like the first two? Great, I'll just copy paste and the **pause to consider an abstraction**. 3 times does not always mean I do an abstraction, it's just an easy number to remember to check.

**This might be my favourite principle of software development** when it comes to designing better code. The best way to truly this concept is to read [99 bottles of OOP by Sandi Metz][99-bottles] and to practice it every day.

## Mental Models

### Pareto principle

> The Pareto principle (also known as the 80/20 rule, the law of the vital few, or the principle of factor sparsity) states that, for many events, roughly 80% of the effects come from 20% of the causes. - Wikipedia

This concept has served me again and again and again. You can try applying it in many ways. Here are some examples:

- Who are the 20% of people you spend time with that take 80% of your energy away?
- What are the 20% of things you spend time on that produce 80% of your output?
- What is the 80% of features you can build quickly vs the last 20% which will extend the deadline by double?

### The Sociotechnical system

I first heard this term from [Avdi Grimm.][avdi] The truth is that, as a software developer in the tech industry, you don't work on technical systems – you work on sociotechnical systems.

Put simply, it means that the total system includes computers **and humans**. To be effective, you must always remember this. You might have heard that all problems in software development are people problems. I believe that.

This is just a nice word to help remember.

### The UI stack

Coming soon

### Hill Chart

Coming soon

### Omega mess

Coming soon

## Cookbook

### I am not discovering bugs until the code is in production.

Coming soon

### My UI is ugly

Coming soon

### My project does not seem to be progressing. We keep having meetings instead of shipping anything useful.

Coming soon

## Just the links please

I stand on the shoulders of giants. Thank you to all of my amazing teachers, whether they know they are my teachers or not.

1. [Superforecasting by Philip Tetlock and Dan Gardner][superforecasting]
2. [99 Bottles of OOP by Sandi Metz][99-bottles]
3. [Writing Software keynote by DHH][writing-software-talk]
4. [Making Good Decisions as a Product Manager by Brandon Chu][making-good-decisions]
5. [Avid Grimm][avdi]

[superforecasting]: https://www.penguinrandomhouse.com/books/227815/superforecasting-by-philip-e-tetlock-and-dan-gardner/
[99-bottles]: https://www.sandimetz.com/99bottles
[writing-software-talk]: https://www.youtube.com/watch?v=9LfmrkyP81M
[making-good-decisions]: https://blackboxofpm.com/making-good-decisions-as-a-product-manager-c66ddacc9e2b
[avdi]: https://avdi.codes/
