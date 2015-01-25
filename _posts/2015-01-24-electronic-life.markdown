---
layout: post
title:  "Experiment: Electronic Life"
date:   2015-01-24 13:31:00
categories: experiments
tags: experiments javascript
live: "//awaselnuk.github.io/electronic-life/"
github: "//github.com/AWaselnuk/electronic-life"
cover: "http://38.media.tumblr.com/a7c1fb8071e4f9dfa12a9a40b90879c2/tumblr_n85aner12e1qzw1qyo1_500.gif"
readings:
  - title: Eloquent JavaScript
    url: "//eloquentjavascript.net/07_elife.html"
  - title: FloraJS - Simulate Natural Systems With JavaScript
    url: "//github.com/vinceallenvince/FloraJS"
---

This isn't what you might call an experiment in the usual sense. The code does not explore any cutting edge web technology. What it does do is demonstrate rock solid object oriented javascript.

Electronic Life is a javascript exercise from the incredible book [Eloquent JavaScript](http://eloquentjavascript.net/) by Marijn Haverbeke. I recently decided to get back to first principles with javascript. This is a book that I come back to time after time. It has always taught me something new, even after gaining a lot of experience writing javascript.

Here is a short sample of some code from the exercise.

<div>
{% highlight javascript linenos %}
//// Critter Class
var directions = {
  "n":  new Vector( 0, -1),
  "ne": new Vector( 1, -1),
  "e":  new Vector( 1,  0),
  "se": new Vector( 1,  1),
  "s":  new Vector( 0,  1),
  "sw": new Vector(-1,  1),
  "w":  new Vector(-1,  0),
  "nw": new Vector(-1, -1)
};

var directionNames = "n ne e se s sw w nw".split(" ");

function BouncingCritter() {
  this.direction = randomElement(directionNames);
};

BouncingCritter.prototype.act = function(view) {
  if (view.look(this.direction) != " ") {
    this.direction = view.find(" ") || "s";
  }
  return { type: "move", direction: this.direction };
};
{% endhighlight %}
</div>

There is quite a bit missing from this snippet but hopefully you can get a feel for the style of the code.
Responsibilities are organized into "classes" (which are simply javascript functions with capitalized names).
When an object is needed it is invoked with the **new** keyword, as in <code>new Vector(0, -1)</code>.

The BouncingCritter class is defined and given one property: <code>direction</code>. To add behaviour a function is attached to the prototype.
For a much better explanation of why things are done this way [check out the exercise in full](http://eloquentjavascript.net/07_elife.html).

The silly bouncing critters simply look for a random empty space nearby using `view.find()`. If they can't find one they head south. They aren't terribly smart.

I highly recommend the book and this exercise for anyone trying to get their heads around object oriented javascript.

## On a related topic...

This exercise sparked my interest in exploring natural simulations in the browser. It turns out I'm not the only one interested in this. I found an incredibly fun looking library that provides tools for doing this easily. It's called [FloraJS](https://github.com/vinceallenvince/FloraJS). If Electronic Life seems fun, just wait until you see what FloraJS can do!

{% include further_reading.html %}

{% include external_links.html %}

