---
layout: post
title:  "Dumb Facebook Posts That Make You Think"
date:   2016-05-15 22:11:00
categories: mathematics
---

Facebook is more or less dead to me. Between my mom becoming an active "post sharer", and the current political election, it has become clickbait, anger-stoking central.
But I've been a member since 2005, so I'm not deleting my account or anything. I mean, the curation of my profile alone has been over a decade in the making. That's a lot of man hours.
But it has become more of a side show than a daily destination. 

However, a few weeks ago when I checked in, I had been summoned to weigh in on a mathematical concern. Shitty meme or no, I was overjoyed to be presented with some mental
stimulus. But rather than wanting to prove a bunch of people wrong, or show everyone how quickly I can solve riddles, I was interested in thinking about this problem
critically. 

![The dumb post in question](https://raw.githubusercontent.com/bdetweiler/bdetweiler.github.io/master/images/facebook_post.jpg "The dumb post in question")

The subject in question, was posted by [Randal Jones Latin Juggalo](https://www.facebook.com/randall.joneslatinjuggalo/posts/1048238075247858) with the caption, 
"Can you figure this out...only one in a thousand will get it". Just like magnets (how do they work?!)

This post inspired 3.1 million comments and over 140k shares, so I'm not about to scrape all of those and try to figure out how many people got it right. Particularly since
I'm not sure if we can say what is right. And that's what I want to get to here.

I was called to weigh in on this mess after a friend of mine was convinced the answer was 40. He vigorously defended his answer, citing something about "the rules of non-function, non-integral, linear math".
Whatever all that means. I didn't know there were different kinds of math. I thought it was all just math. I'm digressing. Let's get to the meat.

The title, "compartilhe se entendeu", is in Portuguese, which means There's a whole
[shitload](https://www.google.com/search?q=compartilhe+se+entendeu&espv=2&biw=1866&bih=994&tbm=isch&imgil=kfJT4jQNgLt3pM%253A%253BWrIp-XVpvem6yM%253Bhttps%25253A%25252F%25252Fwww.flickr.com%25252Fphotos%25252Fmarciofiorini%25252F10617874024&source=iu&pf=m&fir=kfJT4jQNgLt3pM%253A%252CWrIp-XVpvem6yM%252C_&usg=__DE6TWYPDBNIv6m2AehT_uzluLsQ%3D&dpr=0.9#tbm=isch&q=compartilhe+se+entendeu)
of these stupid memes out there. I assume this was short for, "share if you understand what the hell I'm even asking you to do here." 

Because there are no instructions. There is no explanation. There is very little information. We've made the assumption that this is some sort of sequence and we're supposed to replace the question
mark with the next value in the sequence. But this is a leap, given the virtual nothing we have to work with.

Here's what we know:

1. 1 plus 4 does indeed equal 5.
2. 2 plus 5 does not equal 12.
3. 3 plus 6 does not equal 21.
4. The plus operator is bullshit, so we can safely ignore it as a standard addition operator.
5. A question mark is not typically a variable, but in this case, it must be. I guess we're solving for ?
6. We are not told if this is some kind of sequence, or if there is some relationship between each of the lines, but our intuition tells us there must be! Careful!
7. If 6 is true, then we can further make an assumption that either 8 + 11 is next in the sequence, or that there are missing parts in the sequence as it is presented.

Between 6 and 7 is where it gets interesting. If we have made the assumption that this is indeed some kind of sequence where the operators are made up and the points don't matter, then
we can start to formulate an answer. However, your answer will differ depending on where you stand on 7. If you're like my friend, die hard that there is nothing missing in the sequence 
that was given to us, then you start to formulate a response.

Using your pattern deducing skills, you realize that while 2 + 5 does not equal 12, 2 + 5 + 5 does! And 5 was the result from the first line! Maybe there's a pattern here! 3 + 6 doesn't equal 21, but
3 + 6 + 12 does! Holy shit! I'm one of those in the thousand that is going to get this right! And then you make your extrapolation that 8 + 11 + 21 = 40 and you press "post" and sit back and wait
for your vindication. 

Except it never comes. Because your friends, thinking they are smarter than you, have realized step 7. There are missing pieces in this sequence. So they do their best to extrapolate the rest.

4 + 7 + 21 = 32

5 + 8 + 32 = 45

6 + 9 + 45 = 60

7 + 10 + 59 = 77

8 + 11 + 77 = 96

Now your friends are all responding with their answer, thinking they have cured cancer better than you. You argue, grumble, then silently concede before posting a
story about how Hillary may choose Bernie Sanders as her running mate and forgetting about the whole thing.

But nothing has been solved here. All we've done is found some sort of pattern in a nonsensical meme.

My friend made some sort of argument for the 40 answer based in linearity. Yet, neither of these scenarios are linear. Linearity requires that all of these equations be directly proportional to
one another, and this is clearly not the case. 

In fact, there is a solution that produces the same result that does not rely on any sort of pattern. It is simply a * (b + 1) = c, and this holds for the entire dumb meme. This is illustrated
elegantly by plotting the points:

![The supposedly correct answer](https://raw.githubusercontent.com/bdetweiler/bdetweiler.github.io/master/images/facebook_post_answer_right.jpg "The supposed correct answer")

However, using the pattern logic and not assuming that 7 is correct, we end up with a much less likely fit:

![The definitely not correct](https://raw.githubusercontent.com/bdetweiler/bdetweiler.github.io/master/images/facebook_post_answer_wrong.jpg "The definitely not correct answer")

I am hesitant to say that 96 is hands down the correct answer, simply because I have not been asked a formal question with complete information. I am forced to extrapolate this meme into a question
with some information that I have to make further assumptions on. If I wanted to play it really safe, I would say the answer is 60.66666667. How did I get that? Linear regression, with y = 8x -
3.333, which has an R^2 of 0.999. Hey, given the information we're given, I'd say that's a pretty satisfactory answer.

![The plausible answer? Sure, why not.](https://raw.githubusercontent.com/bdetweiler/bdetweiler.github.io/master/images/facebook_post_answer_mine.jpg "A plausible answer? Sure, why not.")

