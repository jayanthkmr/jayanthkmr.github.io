---
title: 'Philosophy of System Implementation'
date: 2018-06-25
permalink: /system-manifesto/philosophy/
tags:
  - system philosophy
  - excellence engineering
  - system architecture
---

Philosophy of System Implementation
===================================

Developed from the experience of Unix philosophy, not as vague generalities but leads to specific prescriptions.
----------------------------------------------------------------------------------------------------------------

![](https://miro.medium.com/max/1400/0*ACH7KU5BSj7yc00q)

Trivia
======

[**Eric S. Raymond**](https://en.wikipedia.org/wiki/Eric_S._Raymond), the author of the book, _The art of Unix programming_ coined an [**aphorism**](https://en.wikipedia.org/wiki/Aphorism) he dubbed “ [**Linus’ Law**](https://en.wikipedia.org/wiki/Linus%27_Law)”, inspired by [**Linus Torvalds**](https://en.wikipedia.org/wiki/Linus_Torvalds): “Given enough eyeballs, all [**bugs**](https://en.wikipedia.org/wiki/Software_bug) are shallow”, which first appeared in his book _The Cathedral and the Bazaar_. More formally: “Given a large enough [**beta-tester**](https://en.wikipedia.org/wiki/Beta_test)  and co-developer base, almost every problem will be characterized quickly and the fix obvious to someone.” Presenting the code to multiple developers with the purpose of reaching consensus about its acceptance is a simple form of [**software reviewing**](https://en.wikipedia.org/wiki/Software_review).

Prologue
========

The main underlying attitude required for following the philosophy is that you have be loyal to [**excellence**](https://en.wikipedia.org/wiki/Excellence). You have to believe that software design is a craft worth all the intelligence, creativity, and passion you can muster. Otherwise you won’t look past the easy, stereotyped ways of approaching design and implementation; you’ll rush into coding when you should be thinking. You’ll carelessly complicate when you should be relentlessly simplifying-and then you’ll wonder why your code bloats and debugging is so hard.

When you see the right thing, do it-this may look like more work in the short term, but it’s the path of least effort in the long run. If you don’t know what the right thing is, do the minimum necessary to get the job done, at least until you figure out what the right thing is.

To do the philosophy right, you have to value your own time enough never to waste it. Never work harder than you have to; work smarter instead, and save the extra effort for when you need it. Lean on your tools and automate everything you can.

The systems philosophy is based on core values of Unix, which made it durable, stable, adaptable and success; they are paraphrased from the book — “_The art of Unix programming_” by Raymond, Eric S. Lets delve into the seventeen rules of the philosophy with the above right attitudes:

Rules
=====

1\. Rule of Modularity: Write simple parts connected by clean interfaces.
=========================================================================

> _Controlling complexity is the essence of computer programming._ [Brian Kernighan](https://en.wikipedia.org/wiki/Brian_Kernighan)

Debugging dominates development time, and getting a working system out the door is usually less a result of brilliant design than it is of managing not to trip over your own feet too many times. The only way to implement complex software system that won’t fall on its face is to hold its global complexity down — to build it out of simple parts connected by well-defined interfaces, so that most problems are local and you can have some hope of upgrading a part without breaking the whole.

2\. Rule of Clarity: Clarity is better than cleverness.
=======================================================

Because maintenance is so important and so expensive, write programs as if the most important communication they do is not to the computer that executes them but to the human beings who will read and maintain the source code in the future (including yourself). Code that is graceful and clear is less likely to break — and more likely to be instantly comprehended by the next person to have to change it. This is important, especially when that next person might be yourself some years down the road.

3\. Rule of Composition: Design programs to be connected to other programs.
===========================================================================

It’s hard to avoid programming [**overcomplicated monoliths**](https://en.wikipedia.org/wiki/Monolithic_application) if none of your programs can talk to each other. To make system composable, make them independent. A program on one end of interface should care as little as possible about the program on the other end. It should be made easy to replace one end with a completely different implementation without disturbing the other.

4\. Rule of Separation: Separate policy from mechanism; separate interfaces from engines.
=========================================================================================

A common design paradigm is to separate high-level policies from their low-level mechanisms. The mechanism can be thought as providing the answer to a _how_ question about a system (for example, how to do context switch). The policy provides the answer to a _which_ question (for example, which process to evict to do context switch). Separating the two allows one easily to change policies without having to rethink the mechanism and is thus a form of modularity, a general software design principle.

Hardwiring policy and mechanism together has two bad effects: It makes policy rigid and harder to change in response to user requirements, and it means that trying to change policy has a strong tendency to destabilize the mechanisms. On the other hand, by separating the two we make it possible to experiment with new policy without breaking mechanisms. We also make it much easier to write good tests for the mechanism (policy, because it ages so quickly, often does not justify the investment).

One thing to keep in mind, mechanism-policy separation is double-edged sword. The cost of the mechanism-not-policy approach is that when the user can set policy, the user must set policy. Non-technical end-users frequently find such profusion of options and interface styles overwhelming and retreat to systems that at least pretend to offer them simplicity. In the long term, however, it may turn out that this ‘mistake’ confers a critical advantage-because policy tends to have a short lifetime, mechanism a long one. So, today’s optimal policy too often becomes tomorrow’s evolutionary dead end and thus, will allow the system to survive, if mechanism and policy aren’t tightly coupled.

5\. Rule of Simplicity: Design for simplicity; add complexity only where you must.
==================================================================================

> _Everything should be made as simple as possible, but no simpler._

Many pressures tend to make programs more complicated (and therefore more expensive and buggy). One such pressure is [**technical machismo**](https://www.theglobeandmail.com/technology/toxic-masculinity-in-silicon-valley/article35759481/) among programmers, often competing with their peers to see who can build the most intricate and beautiful complexities. Even more often (at least in the commercial software world) excessive complexity comes from project requirements that are based on the marketing fad of the month rather than the reality of what customers want or software can actually deliver.

The only way to avoid these traps is to encourage a software culture that knows that small is beautiful, that actively resists bloat and complexity: an engineering tradition that puts a high value on simple solutions, that looks for ways to break program systems up into small cooperating pieces ([**Modularity**](https://www.techopedia.com/definition/24772/modularity)), and that reflexively fights attempts to gussy up programs with a lot of chrome.

6\. Rule of Parsimony: Write a big program only when it is clear by demonstration that nothing else will do.
============================================================================================================

‘Big’ here has the sense both of large in volume of code and of internal complexity. Allowing programs to get large hurts maintainability. Because people are reluctant to throw away the visible product of lots of work, large programs invite over-investment in approaches that are failed or suboptimal.

7\. Rule of Transparency: Design for visibility to make inspection and debugging easier.
========================================================================================

A particularly effective way to ease debugging is to design for transparency and discoverability. A software system is transparent when you can look at it and immediately understand what it is doing and how. It is discoverable when it has facilities for monitoring and display of internal state so that your program not only functions well but can be seen to function well.

Debugging should be designed in from the beginning — from the point of view that the program should be able to both demonstrate its own correctness and communicate to future developers the original developer’s mental model of the problem it solves. The objective of designing for transparency and discoverability should also encourage simple interfaces that can easily be manipulated by other programs — in particular, test and monitoring harnesses and debugging scripts.

8\. Rule of Robustness: Robustness is the child of transparency and simplicity.
===============================================================================

Software is said to be [**robust**](https://en.wikipedia.org/wiki/Robustness_(computer_science)) when it performs well under unexpected conditions which stress the designer’s assumptions, as well as under normal conditions. The way to make robust programs is to make their internals easy for human beings to reason about. There are two main ways to do that: [**transparency**](https://en.wikipedia.org/wiki/Transparency_(behavior)) and [**simplicity**](https://en.wikipedia.org/wiki/Simplicity).

Software is transparent when you can look at it and immediately see what is going on. It is simple when what is going on is uncomplicated enough for a human brain to reason about all the potential cases without strain. The more your programs have both of these qualities, the more robust they will be.

One very important tactic for being robust under odd inputs is to avoid having special cases in your code. Bugs often lurk in the code for handling special cases, and in the interactions among parts of the code intended to handle different special cases.

9\. Rule of Representation: Fold knowledge into data so program logic can be stupid and robust.
===============================================================================================

Even the simplest procedural logic is hard for humans to verify, but quite complex data structures are fairly easy to model and reason about. Data is more tractable than program logic. It follows that where you see a choice between complexity in data structures and complexity in code, choose the former. More: in evolving a design, you should actively seek ways to shift complexity from code to data.

10\. Rule of Least Surprise: In interface design, always do the least surprising thing.
=======================================================================================

The easiest programs to use are those that demand the least new learning from the user — or, to put it another way, the easiest programs to use are those that most effectively connect to the user’s pre-existing knowledge.

Therefore, avoid gratuitous novelty and excessive cleverness in interface design. When designing an interface, model it on the interfaces of functionally similar or analogous programs with which your users are likely to be familiar. Pay attention to your expected audience. Pay attention to tradition. The traditions exist for a good reason: to tame the learning curve. Learn and use them.

The flip side of the Rule of Least Surprise is to avoid making things superficially similar but really a little bit different. This is extremely treacherous because the seeming familiarity raises false expectations. It’s often better to make things distinctly different than to make them almost the same.

11\. Rule of Silence: When a program has nothing surprising to say, it should say nothing.
==========================================================================================

When a program has nothing interesting or surprising to say, it should shut up . Well-behaved programs do their jobs unobtrusively, with a minimum of fuss and bother.

> _Silence is golden._

Well-designed programs treat the user’s attention and concentration as a precious and limited resource, only to be claimed when necessary.

12\. Rule of Repair: When you must fail, fail noisily and as soon as possible.
==============================================================================

> _Be liberal in what you accept, and conservative in what you send._ [Jon Postal](https://en.wikipedia.org/wiki/Jon_Postel)

Software should be transparent in the way that it fails, as well as in normal operation. It’s best when software can cope with unexpected conditions by adapting to them, but the worst kinds of bugs are those in which the repair doesn’t succeed and the problem quietly causes corruption that doesn’t show up until much later.

Therefore, write your software to cope with incorrect inputs and its own execution errors as gracefully as possible. But when it cannot, make it fail in a way that makes diagnosis of the problem as easy as possible.

13\. Rule of Economy: Programmer time is expensive; conserve it in preference to machine time.
==============================================================================================

In the early computer days, this was still a fairly radical idea (machines were a great deal slower and more expensive then). Nowadays, with every development shop and most users awash in cheap machine cycles, it may seem too obvious to need saying.

Most applications should be written in higher-level languages like Python, Java, Go and even shell — languages that ease the programmer’s burden by doing their own memory management instead of sticking to the old-school strategy of coding in C (or C++). One other obvious way to conserve programmer time is to teach machines how to do more of the low-level work of programming.

14\. Rule of Generation: Avoid hand-hacking; write programs to write programs when you can.
===========================================================================================

Human beings are notoriously bad at sweating the details. Accordingly, any kind of hand-hacking of programs is a rich source of delays and errors. The simpler and more abstracted your program specification can be, the more likely it is that the human designer will have gotten it right.

Generated code (at every level) is almost always cheaper and more reliable than hand-hacked. It pays to use code generators when they can raise the level of abstraction — that is, when the specification language for the generator is simpler than the generated code, and the code doesn’t have to be hand-hacked afterwards.

15\. Rule of Optimization: Prototype before polishing. Get it working before you optimize it.
=============================================================================================

> _90% of the functionality delivered now is better than 100% of it delivered never._ [Brian Kernighan](https://en.wikipedia.org/wiki/Brian_Kernighan) and [P. J. Plauger](https://en.wikipedia.org/wiki/P._J._Plauger)

Prototyping first may help keep you from investing far too much time for marginal gains. Rushing to optimize before the bottlenecks are known may be the only error to have ruined more designs than feature creep. From tortured code to incomprehensible data layouts, the results of obsessing about speed or memory or disk usage at the expense of transparency and simplicity are everywhere. Disturbingly often, premature local optimization actually hinders global optimization (and hence reduces overall performance). A prematurely optimized portion of a design frequently interferes with changes that would have much higher payoffs across the whole design, so you end up with both inferior performance and excessively complex code.

> _Make it run, then make it right, then make it fast._

Get your design right with an un-optimized, slow, memory intensive implementation before you try to tune. Then, tune systematically, looking for the places where you can buy big performance wins with the smallest possible increases in local complexity. Using prototyping to learn which features you don’t have to implement helps optimization for performance; you don’t have to optimize what you don’t write. The most powerful optimization tool in existence may be the delete key.

16\. Rule of Diversity: Distrust all claims for “one true way”.
===============================================================

Even the best software tools tend to be limited by the imaginations of their designers. Nobody is smart enough to optimize for everything, nor to anticipate all the uses to which their software might be put. Designing rigid, closed software that won’t talk to the rest of the world is an unhealthy form of arrogance.

Have a healthy mistrust of “one true way” approaches to software design or implementation. Embrace multiple languages, open extensible systems, and customization hooks everywhere.

17\. Rule of Extensibility: Design for the future, because it will be here sooner than you think.
=================================================================================================

> _When you design for the future, the sanity you save may be your own._

Never assume you have the final answer. Therefore, leave room for the data formats and code to grow; otherwise, you will often find that you are locked into unwise early choices because you cannot change them while maintaining backward compatibility.

When you design protocols or file formats, make them sufficiently self-describing to be extensible. When you design code, organize it so future developers will be able to plug new functions into the architecture without having to scrap and rebuild the architecture. You owe this grace to people who will use and maintain your code after you. You’ll be there in the future too, maintaining code you may have half forgotten under the press of more recent projects.

Epilogue
========

In the end, it all boils down to one principle, [**KISS**](https://en.wikipedia.org/wiki/KISS_principle)**.**

> **Keep it Simple, Stupid.**

Keep the implementation simple, considering yourself stupid enough to forget the codebase so as to add the necessary safety net around it in terms of debugging, maintainability, extensibility etc.

Navigation
==========

This article is part of the series on [**System Manifesto : Wisdom, Philosophy and Principles**](https://medium.com/@jayanthj/systems-manifesto-wisdom-philosophy-and-principles-17bd70317586).

In this series of System Manifesto, the other sections are:

*   [**Wisdom for System Design**](https://medium.com/@jayanthj/wisdom-for-systems-design-cc3e04ab6d81)
*   [**Principles for Systems Optimization**](https://medium.com/@jayanthj/principles-for-systems-optimization-61226f140fca)

Reference
=========

1.  Varghese, George. _Network algorithmics_. Chapman & Hall/CRC, 2010.
2.  Raymond, Eric S. _The art of Unix programming_. Addison-Wesley Professional, 2003.
3.  Arpaci-Dusseau, Remzi H., and Andrea C. Arpaci-Dusseau. _Operating systems: Three easy pieces_. Vol. 151. Wisconsin: Arpaci-Dusseau Books, 2014.
4.  Lampson, Butler W. “Hints for computer system design.” _ACM SIGOPS Operating Systems Review_. Vol. 17. №5. ACM, 1983.
5.  Hunt, Andrew, David Thomas, and Ward Cunningham. _The pragmatic programmer: from journeyman to master_. Addison-Wesley Professional, 2000.

_Originally published at_ [_https://www.linkedin.com_](https://www.linkedin.com/pulse/philosophy-systems-implementation-jayanth-jayanth/) _on June 24, 2018._
