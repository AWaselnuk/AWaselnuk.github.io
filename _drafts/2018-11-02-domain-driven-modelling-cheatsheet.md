---
layout: post
title: "Domain Driven Modelling Cheatsheet"
date: 2018-11-02 07:00:00
tags:
  - design
  - DDD
  - cheatsheet
readings:
  - title: "Domain-Driven Design"
    author: "Eric Evans"
    url: "http://www.amazon.com/exec/obidos/ASIN/0321125215/domainlanguag-20"
  - title: "DDD Reference"
    author: "Eric Evans"
    url: "http://domainlanguage.com/ddd/reference/"
---

## Entities (aka. Reference Objects)

An object defined by a thread of continuity and identity, rather than its attributes.

##  Value Objects

An object defined by its specific attributes rather than its identity.

## Services

A concept that is better modelled as process rather than as a Thing.

## Modules

A way to categorize related things at a higher level. There should be low coupling between Modules and high cohesion within them.

## Aggregates

A cluster of associated objects that we treat as a unit for the purpose of data changes. One object in the cluster will act as the Aggregate root and provide the interface.

## Factories

Something that manages creation of objects when the process of assembly is complicated. It will take some arguments that serve the needs of a client and return a valid object.

## Repositories

An object that provides an interface for global access to other objects that require it. A common example is accessing a database - adding the infrastructure details to the domain layer would muddy the model.
