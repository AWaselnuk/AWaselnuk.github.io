---
layout: project
title: Here Be Taverns
live: http://www.herebetaverns.com
cover: "here-be-taverns.png"
excerpt: Find inspiration for your next story or role playing game! "Here Be Taverns" generates random fantasy taverns to suit your mood and your story's setting. Read on for a discussion about what I learned building this super fun Ruby on Rails application.
date: 2015-03-28 12:45:00
---

**TL;DR**

This is a very long post. To summarize, I made an app for roleplaying games called [Here Be Taverns]({{ project.live }}) and I learned a bunch of lessons and techniques along the way.

## A Tool for Game Masters

I love to play table top games. Role playing games and board games have been a major hobby of mine for a couple of years now. When you run a Dungeon and Dragons game, you will find that you often need to come up with names, places, and story ideas spontaneously. There is great fun in improvising, but I wanted to create a web app that would give Game Masters a helping hand. And so, Here Be Taverns was born!

Here Be Taverns generates random content for fantasy role playing games based on a mood and a locale. You can roll a completely random tavern or you can select a mood or locale of your choice. The mood and locale will influence the results of the generator. When your tavern is generated you get:

* A name for the tavern
* A mood and locale (i.e. 'horrifying' and 'mountains')
* A description of the inns appearance
* A menu item
* Characters with name, race, job, quirk, and quote. (i.e. Loroz Stonefist the dwarf paladin)
* Some story hooks and interactions between the characters to inspire your own tale!

## Built on Rails

I built Here Be Taverns using the Ruby on Rails web framework. I was in the process of learning Rails at the time at my job so I wanted to start a side project to expand on that learning. It was an easy choice to make as the process of developing with Rails is extremely enjoyable!

Now that the project is live, I can look back and say with confidence that Rails was a good choice. It provided everything I needed with only a few gems to fill in some gaps.

Of course, it wasn't all smooth sailing and I learned a lot along the way. Read on ...

## Techniques & Lessons Learned

### Refactoring VS Early Validation

In recent times, the boom of tech startups have popularized the idea of early validation. The basic idea is that when you are creating a product, you shouldn't assume you know everything your customers are going to want. Instead, you should trim the fat, focus very narrowly on your core offering, and launch something as soon as possible. Once your product has launched, you can start iterating based on real feedback or data rather than guessing.

At the start of Here Be Taverns I thought to myself "I'm just going to build something quickly. This is only a side project for fun; I should get it out there soon!". Oh how naive I was. You would think that something as silly as a fantasy content generator would take very little time to create. It didn't. It took me a long time and here's why:

**Refactoring.**

Each month I would come back to the project having learned a ton on the job. I would see code I had written and be repulsed by it, and so I would refactor. This was a great learning technique but a terrible product building technique. The launch of Here Be Taverns was severly delayed by my unwillingness to work with my own code.

In the end, I finally got the things fixed that I wanted to fix and the app is live. Is it still in need of refactoring work? Of course it is. There is always refactoring to do.

The key lesson here is to launch earlier and think about refactoring as a long term activity rather than something that *has* to be done before launch. For all I know I have refactored a bunch I things I am about to rip out once real people tell me about the features they actually want.

### Randomness

The whole point of Here Be Taverns is to generate random content. The way I approached this was to separate my rails models into as many components as possible. For example, to generate a random tavern name I have a table for adjectives and nouns. To create even more variations I occassionaly add in name's of characters from my name tables and append suffixes. Here is some code from a support model that generates a tavern name:

{% highlight ruby linenos %}
def initialize(attributes = {})
  @mood = attributes[:mood]

  roll = rand(4) + 1
  @variation = roll

  # Assign Adjectives, Nouns, Character Name based on random chance
  @adjective = Adjective.random(mood: @mood).name.capitalize if roll.odd?
  @first_noun = Noun.random.name.capitalize if roll < 4
  @second_noun = Noun.random.name.capitalize if roll == 2
  @character_name = attributes[:character_name][/(\S+)/, 1] if roll == 4
end
{% endhighlight %}

#### Pulling Random Rows

Selecting a row randomly from the database turned out to have an interesting solution. It turns out that database engines often have a function for random ordering like `RANDOM` or `RAND`. The problem is these can lead to performance issues on larger tables because when you say "Hey database order the table randomly and then give me the first row" the table says "Okay, I am going to go through every single row and assign it a random number and then limit my selection to one". Asking for one thing results in a computation on every single row in the table!

A better way to approach this results in two database queries but both queries are very fast and don't become any slower no matter how large the dataset grows. Essentially ask for the number of items in the table (databases are optimised to give you this value) and then query for one item at a random offset that is within the appropriate range. Here is how I did that:

{% highlight ruby linenos %}
// From noun.rb
def self.random
  offset(rand(count)).first
end
{% endhighlight %}

### Adding Content

It turns out that creating content for something like this is very time consuming. I have nowhere near the amount I want and I have already spent days of work on it. Given the size of the task, I wanted to enlist help from my wife for adding and creating content. As she is a non technical person, I knew I would need some sort of administrative interface for adding content.

Although there are many gems that achieve this very quickly (ActiveAdmin comes to mind), I wanted something even quicker. I did not want to invest the time to build an administrative interface at all, so I decided to instead build a simple mechanism for importing data from an existing tool. What I ended up with was a group of rake tasks that import data from CSV files. For Here Be Taverns, my wife and I added content to spreadsheets in Google Docs and then I was able to import that data when we were finished. Here is some example code:

{% highlight ruby linenos %}
task :create_quirks => :environment do
  # name sex
  CharQuirk.destroy_all
  CSV.foreach("#{Rails.root}/data/characters/quirks.tsv", col_sep: "\t", headers: true, converters: :strip) do |row|
    CharQuirk.create!( name: row[0], char_sex: row[1] )
  end
  puts "Created Quirks."
end
{% endhighlight %}

I am very unhappy with how this turned out.

First of all, it is not future friendly. As we add more data, it is painful for me to export the spreadsheets from Google and then load the data into the Rails app. Even a basic admin interface would not have that problem, as we would be able to simply add data to production as we think of it. Secondly, the code is brittle. What if I decide to switch sex to the first row? Everything would break. Rails has a lot of tools for doing this kind of thing more intelligently without depending on the way the data is structured so rigidly. Finally, it is inefficient. To maintain idempotence I simply call `destroy_all`. It is a simple way to solve the problem of duplicating data but it is such a wasteful way of doing things. It is acceptable for now, but I can forsee major refactoring here as my datasets grow larger.

### Tagging system

From the very beginning, one of my main ideas was to provide different content based on mood and locale. Are you looking for a comical atmosphere set in a port city? A seedy tavern deep in a swamp? I've got you covered. To build this feature I used a tagging system I knew about at the time called [ActsAsTaggableOn](https://github.com/mbleigh/acts-as-taggable-on). I wanted tags because I wanted certain pieces of data to support multiple moods or locales or both.

To be honest I don't think that using this gem was the way to go here. It has added a whole bunch of extra tables that I know nothing about to support a feature which I am only using a portion of. The trap I fell into was choosing a technique because I was familiar with it, rather than doing a bit of research first.

Tagging is a good way to categorize user generated content and make it searchable. But in my case I simply want to mark things that I control with a property that may have one or more values. There is already a way to assign multiple values to a property in Postgres: arrays.
I have setup a whole bunch of extra maintenance and infrastructure for myself when I could have simply done something like this:

{% highlight ruby linenos %}
Adjective.where("mood IN (?)", moods)
{% endhighlight %}

Dang.

## The Future of Here Be Taverns

You may have already guessed from the above lessons that in the future, I will be building out a proper admin interface for adding content. It will probably have very little visual paired with some good AJAX interaction for simply adding a bunch of things quickly and painlessly.

Something else I am interested in doing, is designing a simple backend API for getting all the information about an Inn in a JSON format. It should be very easy to implement and the benefits will be twofold:

1. I can give other developers easy access to Here Be Taverns data.
2. I can rework my front end to not require an entire page cycle every time it generates a new Inn.

I am a fan of some of the new tools in the Javascript MV\* world so you can expect to see some aspects of those work there way in when I revisit the interface design.

Thanks so much for reading this far. This was a long one!

{% include external_links.html %}
