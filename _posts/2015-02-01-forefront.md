---
layout: post
title: "Project: Forefront"
github: "//github.com/AWaselnuk/forefront"
excerpt: An opinionated command-line tool for generating front end boilerplate and workflow.
cover: forefront.gif
date: 2015-02-01 09:00:00
tags:
  - project
  - build tools
---

I have been using build tools to power up my front end workflow for a while now. I started out with [Grunt](http://gruntjs.com/) and then tried [Gulp](http://gulpjs.com/). Gulp is currently powering some automation for this very blog.

As I moved back and forth between these two build tools, I continued to rely more and more on [NPM](https://www.npmjs.com/) the NodeJS package manager. NPM is fantastic. A huge selection of useful libraries that are easy to find and use.

So the usual narrative would go something like:

"Okay I want to experiment with something or maybe start a new project. Let's set up some folders."

"Great I have a folder structure, let's create a Gruntfile. What do I need for compiling x and y and doing a and b? Okay cool I'll just use NPM to install all of the gruntified versions of the libraries I like to use."

"Oh also I forget how to do this in Grunt and so I'll just copy and paste a snippet from project v and a snippet from project a and a snippet from stack overflow."

There are obviously some pain points here. I'm not necessarily pointing fingers at anyone, I'm just saying that process could use some work.

The big moment was when I learned about NPM scripts. In your package.json file there is a scripts object that can hold any arbitrary command line snippet you want to use. When I realized I could put scripts in there and then invoke them with `npm run`, I was like:

![Yes.](http://media.giphy.com/media/W9WSk4tEU1aJW/giphy.gif)

The next time I started setting up Grunt, I thought to myself: "Why am I using npm to install 8 grunt dependencies only to then create a Gruntfile that will perform tasks npm can already do." As it turns out, [I was not the first one to think this](http://blog.keithcirkel.co.uk/why-we-should-stop-using-grunt/).

## What is the point of this post?

I realize I've been rambling a bit, but there is a point here and it is not to bash Grunt and Gulp, which I think are pretty great tools.

The point is to introduce something I've been working on called [Forefront](https://github.com/AWaselnuk/forefront).
Forefront solves some major issues in my own workflow. It is a command line tool built on NodeJS that scaffolds my entire front end workflow for me. It provides my folder structure, an Object Oriented SASS setup with some defaults in place, an index.html boilerplate, and the option to write Coffeescript or Ecmascript 6. The best part is that it also builds up a package.json file that supports my workflow of choice using NPM scripts and no other build tool.

The project is incomplete, but what I currently have is already miles ahead of the copying and pasting and manual installation I was doing before.

## Why didn't you just use Yeoman or just git clone things?

I wanted to create something that was less heavy than Yeoman and not tied to any specific other framework. The Forefront interface asks me what I want and only builds what I agree to. I could, for example, use it to quickly install a package.json file and nothing more. I was inspired to follow this approach from a thread surrounding another JS tool coming out in the future called [Cloverfield](https://github.com/ericelliott/cloverfield/issues/2) by Eric Elliot. Cloverfield will end up being a much more thorough implementation for scaffolding JavaScript stuff.

I can't rightfully call Forefront thorough. It is not. The other reason I created it was simply to create. Selfish I know, but there is no better way to learn. Ultimately I think that, although it may only be useful for me right now, it provides a proof of concept for a front end command line workflow that could really go somewhere.

{% include external_links.html %}
