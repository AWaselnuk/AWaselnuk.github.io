---
layout: post
permalink: /articles/:title
title: "Newsletters as Data"
tags:
  - newsletters
  - dev
---

Newsletters are all the rage in the tech industry right now. A link to your [substack](https://substack.com/) profile is quickly becoming a mandatory feature of your Twitter profile. While building [Novus Bestiary](https://www.novusbestiary.com), I stumbled upon a valuable approach to building a newsletter. By thinking about my newsletter as data, I was able to stand up a 40+ page website in a couple of weeks with no outsourcing.

## Building blocks shaped like newsletters

Long term thinking was the key to my success here. I didn't start out with my 'newsletters as data' mental model clearly fleshed out. I started out with a long term vision: build a modern bestiary that chronicles thousands of creatures. When I decided I wanted to build Novus Bestiary, I was a full time employee and a father with three young children. Jumping straight to the end goal was not possible. I realized I could cut scope and still work towards my goal by writing about one creature at a time. A newsletter was the perfect format to share progress as I went.

## My text-based system

With the end in mind, I knew that my weekly newsletter about mythical creatures would eventually become the main data source for a website. With that insight, I came up with a lightweight process to write newsletters while simultaneously building a file-system based datasource. I sketched out a folder structure to add newsletters as markdown files. On top of that, I created a simple system with NodeJS scripts to move the newsletters into Mailchimp.

Here is snippet of the file structure for a newsletter:

<div>
{% highlight text %}
- novusbestiary
  - data
    - basilisk
      - basilisk-mc.html
      - basilisk.json
      - basilisk.md
{% endhighlight %}
</div>

`basilisk.md` - The main content file. This is where I write the newsletter in markdown. I am free to add headings and notes to myself which I can strip out later using a [showdown extension](https://github.com/showdownjs/showdown#extensions).

`basilisk.json` - Metadata about the creature. I want the main writing experience in markdown, but there are additional facts about the creatures I wanted to capture as I went along. Things like sources, origins, aliases, habitats, etc. All that stuff goes in here.

`basilisk-mc.html` - When I am ready to move to Mailchimp, I run a script using showdown to convert the markdown file into HTML. I use a custom made extension to strip out content that I like to have while writing but don't want appearing in the Mailchimp template.

Powering the system are NodeJS scripts. I'll only highlight the two I use for the process of creating a newsletter.

`npm run new basilisk` - Spit out a new creature directory that is ready to write in.
`npm run convert basilisk` - Transform a markdown file for the creature into Mailchimp-ready HTML.

## Simplicity, comfort, and reusability

Simple text files organized in folders are a fantastic data source. They are completely transparent so you can see exacty what's in them. They are trackable in Git. They require no fancy dependencies. Using markdown allows for a nice writing process and the ability to adapt the content to any HTML-based platform. By thinking of newsletters as data, you can incrementally build up a large body of reusable content and then apply it in different ways.

{% include article_signup_form.html %}
