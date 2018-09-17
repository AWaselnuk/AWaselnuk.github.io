---
layout: post
title: "The distance between things"
date: 2018-09-17 15:40:00
tags: quickthought
---

It can be useful to think of a software system as a _physical_ space or geography. There are small towns inside of larger regions.
Things have neighbours and things within a neighbourhood tend to be related. You might notice this when people talk about things being far or near. For example: "This change will have _far reaching_ effects" or "This method should move _closer_ to that class".

Today I resolved a bug where a simple new feature in one area caused an exception in another one that was nowhere near it. In the neighbourhood analogy, you might say that we added a new sink to our kitchen and suddenly the street next to ours had leaking fire hydrants.

This is a sign that something is wrong. **The main thing you must contend with in a growing software system is complexity, and your number one challenge is to keep it understandable as it grows.** When changes in one area affect areas nowhere near it, you have something that is complicated and hard to understand.

I recommend two fixes:

1. Make things understandable through good design (hard)
2. Make things safer through testing (easy)

Approach number 1 is the best but it is difficult and can take a long time. In an ideal world, you would redesign the system so that complexity goes down and the predictability goes up. Common things would move closer together and connections would become obvious.

When you can't afford option number 1, try out option number 2. Whenever there is a surprise moment in the system, write a test case for it. You get safety because the test will fail the next time someone tries to change things in a similar way. Furthermore, the test becomes a map to guide people through the stranger roads and detours.

Try to notice when your team is doing too much of either number 1 or number 2. Most real projects will need both. Design is never perfect and probably never should be.
