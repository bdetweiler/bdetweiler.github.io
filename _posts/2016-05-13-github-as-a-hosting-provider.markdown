---
layout: post
title:  "GitHub As A Hosting Provider"
date:   2016-05-13 18:45:00
categories: musings
---

I can't tell you how many domain names I've registered that have never seen the light of day. All well-intentioned, but never to get off the ground.
There are problems inherent in "building a website." First, there's registering a domain name. Do you want a .com? It's probably taken. How about a domain hack? I'm not that creative.
Then there's the cost of registering a domain that will probably never be used, which was the case for [SexyGirlsEatingBurritos.com](http://sexygirlseatingburritos.com),
[PersonalHoliday.com](http://personalholiday.com), and [Creep.It](http://creep.it). All of them had, what I thought was at the time, a pretty good idea.

Then there is hosting. Now this is where it gets expensive. I once had hosting at [Host Gator](http://hostgator.com), that I never used, but I also forgot to cancel. I ended up paying about $200 just to
cancel a service I never used. Having a website takes commitment, and I'm just not willing to commit. I don't have the time to devote to a full-fledged site, and it sure as shit isn't going to make
me any money, so why bother? 

Likewise, blogging. I can't tell you how many times I've started a blog and watched it get to about two posts before petering out and being forgotten about. I once attempted a 
tech blog called "Hacking the Plains." I'm not even sure if I actually deleted that or if it just sort of faded away. Who knows. Point is, starting these kinds of things is hard. But 
using Jekyll and hosting with GitHub? This is more my speed.

And I'm starting to wonder just what other things I could accomplish using only GitHub Sites.

At the moment, I'm working on (albeit at a snail's pace) a Spartan WOD generator, to generate workouts based on previous Spartan Race WODs. This uses [sql.js](https://github.com/kripken/sql.js/) to
dynamically build a database in memory when the app is loaded, requiring no database or application hosting, only static content. It will then build a Markov chain and send off JSONP calls to 
[OpenCPU](https://www.opencpu.org/) to do the probability calculations for me in R. Nothing but static content hosting required. This is perfect.

Having only static content could be viewed as a constraint, but I like to see it as an oppertunity to be more creative. Let's see where this goes...
