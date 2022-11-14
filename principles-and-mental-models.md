---
layout: default
title: Principles and Mental Models for Software Developers
description: >
  Principles and Mental Models for software developers who are interested in personal growth. These ideas have accumulated
  over the course of my career in the tech industry.
---

[back to articles](/)

# Principles and Mental Models for Software Developers

As my career in the tech industry has progressed, I have tried out many different systems and ideas to continuously improve myself and my craft.
Some of these tools and approaches have stayed with me and become a critical part of my success. On this page, I will be assembling my favourite ideas for quick reference. This will be a living document, updated constantly as I continue to learn, reflect, and grow.

I have divided the concepts into three sections: Principles, Mental Models, and Cookbook. You can think of the [Principles](#principles) as guides for action when faced with a problem. [Mental Models](#mental-models) are simplified models of reality that work well as lenses to apply to your thinking. [The Cookbook](#cookbook) is filled with recipes you can follow to debug problems common to developers.

{% include mental_models_signup_form.html %}

## Table of contents

- [Principles](#principles)
  - [You are bad at predicting the future](#you-are-bad-at-predicting-the-future)
  - [Optimize for change](#optimize-for-change)
  - [Prefer fast decision making to perfect decisions](#prefer-fast-decisions-to-perfect-decisions)
  - [Writing software is like writing french poetry](#writing-software-is-like-writing-french-poetry)
  - [YAGNI](#YAGNI)
  - [Discover abstractions instead of designing them](#discover-distractions-instead-of-designing-them)
  - [Seek feedback early and often](#seek-feedback-early-and-often)
  - [Prototypes are magic](#prototypes-are-magic)
- [Mental Models](#mental-models)
  - [Pareto principle](#pareto-principle)
  - [The Sociotechnical system](#the-sociotechnical-system)
  - [The UI stack](#the-ui-stack)
  - [Hill chart](#hill-chart)
  - [Omega Mess](#omega-mess)
  - [Parkinson's Law](#parkinsons-law)
  - [Type 1 vs Type 2 decisions](#type-1-vs-type-2-decisions)
  - [Stakeholder Matrix](#stakeholder-matrix)
  - [Ubiquitous Language](#ubiquitous-language)
- [Cookbook](#cookbook)
  - [My project is not progressing. We keep having meetings instead of shipping anything useful.](#my-project-is-not-progressing-we-keep-having-meetings-instead-of-shipping-anything-useful)
  - [My UI is ugly or feels awkward.](#my-ui-is-ugly-or-feels-awkward)
  - [The UX team and the Dev team are debating a lot.](#the-ux-team-and-the-dev-team-are-debating-a-lot)

## Principles

### You are bad at predicting the future

Humans are bad at predicting the future. If you don't believe this statement, I recommend diving into the book [Superforecasting][superforecasting]. To make matters worse, software projects are complicated and unique. Looking at past projects to predict the success or shape of the upcoming project may fail, because each project has developers discovering things for the first time. On top of that technical challenge, you are likely working with humans, and those humans will introduce additional complexities and surprises.

I recommend lightweight planning, but I do not recommend having confidence in your predictions.

### Optimize for change

The tech industry changes quickly. Projects that were important last week may suddenly get cancelled. Priorities and teams will shift. To conquer the changing landscape, do not tie your identity or happiness to your current project, but rather the skills and passion you bring to it. Assume all the code you ship is final. Aim for simplicity and cut as much as you can. Large and complicated software changes too slowly.

Write code that reveals your intentions and is easy to change. Make sure you [discover abstractions instead of designing them](#discover-abstractions-instead-of-designing-them).

### Prefer fast decisions to perfect decisions

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

In order to avoid the dangers of [YAGNI](#yagni), you should try to avoid designing abstractions. It is much better to discover them. I use a rule of 3. Do I need some code to act a lot like some other code? Great, I'll just copy and paste! Do I need some third thing to act a lot like the first two? Great, I'll just copy paste and then **pause to consider an abstraction**. 3 times does not always mean I do an abstraction, it's just an easy number to remember to check.

**This is my favourite principle of quality software design.** The best way to understand it is to read [99 bottles of OOP by Sandi Metz][99-bottles] and practice it every day.

### Seek feedback early and often

You may have seen this before:

A developer disappears for a few weeks. In daily standup meetings they always say the same thing: "I am working on X feature". Eventually they emerge from their self-imposed solitude and show the finished feature. The UX team wants to try it out and suggests several changes but the developer feels resentment because those changes should have been in the "spec". Or worse, the feature isn't actually that interesting once the team sees it working. 80% of the time was wasted on 10% of the value.

Don't be that developer.

Consider building a prototype, because [prototypes are magic](#prototypes-are-magic). Describe your progress in a Pull Request. Show the badly working code with none of the edge cases figured out. Sketch out the technical design on a whiteboard. Do SOMETHING to tell the story of your progress every day.

Ask for feedback from the team as soon as you can.

### Prototypes are magic

As a developer, one of the most effective ways you can convince other people to build what you want is to build a prototype. **Prototypes are magic.** I have seen a simple prototype that took 2 days to build trump a well researched project brief that took 4 weeks. Prototypes make abstract arguments concrete and exciting. People light up when they see a real thing working. They can't help it. It seems so _real_.

Develop this skill. Use your super power with caution because it will work.

## Mental Models

### Pareto principle

> The Pareto principle (also known as the 80/20 rule, the law of the vital few, or the principle of factor sparsity) states that, for many events, roughly 80% of the effects come from 20% of the causes. - Wikipedia

This concept has served me again and again and again. You can try applying it in many ways. Here are some examples:

- Who are the 20% of people you spend time with that take 80% of your energy away?
- What are the 20% of things you spend time on that produce 80% of your output?
- What is the 80% of features you can build quickly vs the last 20% which will take as long as the first 80%?

You have limited time, energy, and attention. Apply this principle to understand where you should direct these precious resources.

### The Sociotechnical system

I first heard this term from [Avdi Grimm.][avdi] The truth is that, as a software developer in the tech industry, you don't work on technical systems – you work on sociotechnical systems.

Put simply, it means that the total system includes computers **and humans**. To be effective, you must always remember this. You might have heard that all problems in software development are people problems. I believe that.

This is just a nice word to help remember.

### The UI Stack

The UI Stack describes 5 states you must consider when designing UI for web applications. The most satisfying design will only come after all 5 states have been accounted for. This is a fantastic system to help designers communicate well with front end developers. Front end developers are often forced to consider all 5 states due to the nature of front end coding patterns.

The 5 states are as follows:

1. Empty state - When there are 0 results, or when a customer first sees the page.
2. Loading state - While data is loading.
3. Partial state - When there is only a small amount of data, for example a single table row.
4. Error state - When something has gone wrong.
5. Ideal state - When there is lots of data and the product's full potential is on display. This is the state you want people to see most often.

Scott Hurff wrote the definitive guide to the UI Stack in his essay ["How to fix a bad user interface"](ui-stack). All thanks to him for teaching me.

### Hill Chart

There are many ways you can describe the 'phase' that a project is in. I have found that the simplest way is to split it into two phases: 'Exploration' and 'Build'. When you are in the 'Exploration' phase, you are learning about the problem and brainstorming potential solutions. When you are in the 'Build' phase, you are executing.

A Hill Chart is a visual tool that represents those two phases. It stays simple yet provides more information through metaphor. By describing where you stand 'on the hill', you quickly convey a lot of information about where a project stands. Exploring is difficult. When you begin, you know less than you will ever know for the rest of the project. You might have false starts. It _feels_ like you are _climbing up_ a hill. Building is more straightforward. You can see the final form of things and you gather inertia as you progress. It _feels_ like you are _running down_.

The team at Basecamp developed this mental model. [You can read a thorough description of it on their blog.][hill-charts]

### Omega Mess

A large codebase that has been around for a while will gather lots of messes. Many developers feel discouraged by those ugly bits of code. Their passion for clean code compels them to try to fix everything, but that's a trap. While you are 'fixing' things, many others are adding code. While you are 'fixing' things, your customers are waiting for features they need.

You should stop trying to 'fix everything'. You should free yourself from worry over the _Omega Messes_. _Omega Messes_ are messes that are well encapsulated at the edges of the system. These are the embarrassing files that are only opened once every few months. These are the awkwardly written, private functions near the bottom of the file. These are the messes around old features, the ones that only 5% of your customers actually use. Ignore these _Omega Messes_ with pride and put your mind at ease. Direct your newfound energy towards work that matters.

You _should_ worry about the messes that fall into the opposite category (Alpha Messes?). These are the messes in areas of the code base with high [churn](https://www.pluralsight.com/blog/tutorials/code-churn). These are the messes that sprawl across your critical user flows. Focus on fixing these.

Sandi Metz taught me this concept in her talk: ['Go ahead, make a mess'.][omega-mess]

### Parkinson's Law

Work expands to fill the time available for its completion. This was noted by the twentieth British scholar C. Northcote Parkinson.

Having deadlines, even imperfect ones, produces a great focusing effect for teams who build software. Smart teams will always produce more questions, refactors, and tweaks if given infinite time. Set a deadline with the team and hit it.

### Type 1 vs Type 2 decisions

Type 1 decisions are difficult or impossible to reverse. They represent a large amount of risk. You should invest in a thorough decision making process and proceed carefully.

Type 2 decisions are reversible. If they don't work out, you can always go back or quickly adjust course.

Don't confuse these two types of decisions. Don't apply Type 1 decision making process to Type 2 decisions. Most decisions are Type 2.

### Stakeholder Matrix

Most projects have stakeholders. Start by making sure you have identified all of them. A stakeholder is anyone who may have influence over the direction of your project or interest in its success.

To understand how you should manage these stakeholders, place them into 4 quadrants on a simple grid. On the X axis you have Interest and on the Y axis you have Influence.

<table style="width: 100%; border: 1px solid #ccc;">
  <tr>
    <td style="text-align: center; height: 80px; width: 20%; background-color: #eee;"></td>
    <td style="text-align: center; height: 80px; width: 40%; background-color: #8afacf;">Keep Satisfied</td>
    <td style="text-align: center; height: 80px; width: 40%; background-color: #ffa278;">Manage Actively</td>
  </tr>
  <tr>
    <th style="text-align: center; height: 80px; width: 20%; background-color: #eee;">Influence</th>
    <td style="text-align: center; height: 80px; width: 40%; background-color: #b5ffe5;">Monitor</td>
    <td style="text-align: center; height: 80px; width: 40%; background-color: #8afacf;">Keep Informed</td>
  </tr>
  <tr>
    <td style="height: 80px; width: 20%; background-color: #eee;"></td>
    <th colspan="2" style="height: 80px; text-align: left; width: 40%; background-color: #eee;">Interest</th>
  </tr>
</table>

You should then manage them as follows:

1. Low Interest, Low Influence - Spend little effort here. Monitor them to see if they change interest or influence levels.
2. Low Interest, High Influence - Keep them satisfied. It is unlikely they will bring issues but they have enough influence to derail the project over minor issues.
3. High Interest, Low Influence - Keep them informed. These people are very interested in the project outcomes and deserve to have a clear way to follow its progress.
4. High Interest, High Influence - Manage them actively. These are the key stakeholders for the project and should be close collaborators.

### Ubiquitous Language

Programmers, content strategists, and the wizards of Earthsea share a common understanding. They know that to discover something's name is to have power over it.

[Ubiquitous Language](https://blog.carbonfive.com/ubiquitous-language-the-joy-of-naming/) is the language you actively and continously build with all contributors to a software project. Customers should also be counted as contributors. You can think of it as a glossary of names that everyone agrees on. You would not believe how much time has been lost in software projects on account of people having a different working definition of the word "User".

This concept goes much deeper than the power of good names. It is too deep for this article, but luckily [Eric Evans wrote a whole book on it][ddd].

## Cookbook

### My project is not progressing. We keep having meetings instead of shipping anything useful.

Do you have [deadlines](#parkinsons-law) in place? Deadlines, even imperfect ones, have a great focusing effect. Remember [Parkinson's Law](#parkinsons-law).

Remind your team that you should [prefer fast decision making to perfect decision making](#prefer-fast-decisions-to-perfect-decisions). If you are hesitant, try dividing the decisions blocking progress into [Type 1 vs Type 2 decisions](#type-1-vs-type-2-decisions). You should discover that almost all decisions are Type 2.

Sometimes projects are slowed down by stakeholders. Build a [stakeholder matrix](#stakeholder-matrix) to classify everyone weighing in on the project and then act accordingly.

### My UI is ugly or feels awkward

Have you considered [the UI Stack?](#the-ui-stack)

### The UX team and the Dev team are debating a lot.

Develop a [Ubiquitous Language.](#ubiquitous-language) Seriously it works.

Make sure you [seek feedback early and often](#seek-feedback-early-and-often). Developers are not a production line to be handed "finished designs". Designers are perfectly capable of understanding technical constraints. [Prototypes are magic](#prototypes-are-magic). You should be working together in the early stages and sharing rough works in progress regularly.

## Just the links please

I stand on the shoulders of giants. Thank you to all of my amazing teachers, whether they know they are my teachers or not.

1. [Superforecasting by Philip Tetlock and Dan Gardner][superforecasting]
1. [99 Bottles of OOP by Sandi Metz][99-bottles]
1. [Go ahead, make a mess by Sandi Metz][omega-mess]
1. [Writing Software keynote by DHH][writing-software-talk]
1. [Making Good Decisions as a Product Manager by Brandon Chu][making-good-decisions]
1. [Avid Grimm][avdi]
1. [How to fix a bad user interface by Scott Hurff][ui-stack]
1. [Hill Charts: see where projects really stand by Basecamp][hill-charts]
1. [Domain Driven Design by Eric Evans][ddd]

[superforecasting]: https://www.penguinrandomhouse.com/books/227815/superforecasting-by-philip-e-tetlock-and-dan-gardner/
[99-bottles]: https://www.sandimetz.com/99bottles
[omega-mess]: https://www.youtube.com/watch?v=mpA2F1In41w
[writing-software-talk]: https://www.youtube.com/watch?v=9LfmrkyP81M
[making-good-decisions]: https://blackboxofpm.com/making-good-decisions-as-a-product-manager-c66ddacc9e2b
[avdi]: https://avdi.codes/
[ui-stack]: https://www.scotthurff.com/posts/why-your-user-interface-is-awkward-youre-ignoring-the-ui-stack/
[hill-charts]: https://basecamp.com/features/hill-charts
[ddd]: https://en.wikipedia.org/wiki/Domain-driven_design

{% include mental_models_signup_form.html %}

_Last updated: September 22, 2020_
