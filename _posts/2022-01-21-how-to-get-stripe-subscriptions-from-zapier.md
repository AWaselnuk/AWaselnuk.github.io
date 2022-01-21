---
layout: post
permalink: /articles/:title
title: "How to get Stripe subscriptions from Zapier"
---

[The Stripe API allows you to fetch a list of your subscriptions by date range using the `created` param.](https://stripe.com/docs/api/subscriptions/list) To get a date range, you have to pass the value as a dictionary. This is where I got stuck - it took me way too long to figure out how to pass a dictionary from Zapier. I'm used to having `fetch` available, or an API client library.

## How do you pass dictionary params to Stripe from a Zapier webhook?

The key was figuring out that Stripe's API requires a `GET` request, and that dictionary params would have to be formatted with square brackets like this `created[gte]`. So to get a range of subscriptions, the Query String Params should be:

* `created[gte]` : `16412017634`
* `created[lt]` : `1632622434`

The values on the right are Unix timestamps as per Stripe's documentation.

## How do you get a range of Stripe subscriptions from Zapier?

The final result was a Webhook GET task setup like this:

URL: https://api.stripe.com/v1/subscriptions <br>
Query String Params:

* `created[gte]` : `16412017634`
* `created[lt]` : `1632622434`

Send as JSON: No <br>
Headers:

* `Authorization` : `Bearer sk_test_000000000000`

Here's a picture:

<img alt="Example of fetching Stripe subscriptions by date range from Zapier" src="/img/posts/stripe-zapier-example.jpg">

Hope I saved you some time :)

