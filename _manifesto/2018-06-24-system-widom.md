---
title: 'Wisdom for System Design'
date: 2018-06-24
permalink: /system-manifesto/wisdom/
tags:
  - system wisdom
  - excellence engineering
  - system architecture
---

Wisdom for System Design
========================

Wisdom emerged over years of system design and implementations
--------------------------------------------------------------

![](https://miro.medium.com/max/1400/0*IlFVgMIq8ARmcGWx)

Trivia
======

The authors of the book, _Operating systems: Three easy pieces —_ Arpaci-Dusseau, Remzi H., and Andrea C. Arpaci-Dusseau lead the storage team of [**WISDOM**](http://wisdom.cs.wisc.edu/) ( **Wisconsin Institute on Software-defined Datacenters Of Madison**) at the University of Wisconsin Madison, have years of experience in storage and systems research.

Prologue
========

Software system design is one of the most challenging part of the software development. If the design is right in the first place, the rest of the implementation journey becomes smooth. It requires looking at the requirements, understanding the needs and objectives, evaluating different trade-offs, thinking about error handling and edge cases, contemplating futuristic changes and robustness while worrying about basic details like algorithms and data structures. Such multi-dimensional task not just requires intelligence but a level of wisdom, which can only be acquired by years of practice and experience.

These system wisdom emerged over years of system design and implementation, and are paraphrased from the book — “ _Operating systems: Three easy pieces_” by Arpaci-Dusseau, Remzi H., and Andrea C. Arpaci-Dusseau. Lets delve into those laws of wisdom with an open multi-dimensional mind.

Laws of wisdom:
===============

1\. Lampson’s Law : Get it right!
=================================

> _Get it right. Neither abstraction nor simplicity is a substitute for getting it right._ [_Butler Lampson_](https://en.wikipedia.org/wiki/Butler_Lampson)

Sometimes, you just have to do the right thing, and when you do, it is way better than the alternatives. For example, there were lots of ways to design APIs for process creation; however, the combination of fork() and exec() are simple and immensely powerful. Here, the UNIX designers simply got it right. And because [**Lampson**](https://en.wikipedia.org/wiki/Butler_Lampson) so often “got it right”, the law is named in his honor.

2\. Misbehavior and Safety
==========================

> _Be wary then; best safety lies in fear._ [Laertes](https://en.wikipedia.org/wiki/Laertes_(Hamlet))

In allocating resources, strive to avoid disaster rather than to attain an optimum. Many years of experience with virtual memory, networks, disk allocation, database layout, and other resource allocation problems has made it clear that a general-purpose system cannot optimize the use of resources. On the other hand, it is easy enough to overload a system and drastically degrade the service.

Systems will often have to deal with such overloading misbehaving processes or requests, those that either through design (maliciousness) or accident (bugs) attempt to do something that they shouldn’t or even, trying to game the system. Always incorporate your design for such misbehaviors and edge cases by throwing appropriate errors to handle them, not fulfilling the requests or even, brutally terminating them. Always, have a mechanism to regain control, when sub-systems and process start acting in a non-cooperative fashion, to avoid the painful task of [**formal verification**](https://en.wikipedia.org/wiki/Formal_verification) of the [**formal specification**](https://en.wikipedia.org/wiki/Formal_specification) that the system will always be [**correct**](https://en.wikipedia.org/wiki/Correctness_(computer_science)) and work as intended.

3\. Ousterhout’s Law: Avoid Voodoo constants.
=============================================

Avoiding voodoo constants is a good idea whenever possible. Unfortunately, it is often difficult. One could try to make the system learn a good value, but that too is not straightforward. The frequent result: a configuration file filled with default parameter values that a seasoned administrator can tweak when something isn’t quite working correctly. As you can imagine, these are often left unmodified, and thus we are left to hope that the defaults work well in the field. This tip was brought to you by OS professor, [**John Ousterhout**](https://web.stanford.edu/~ouster/cgi-bin/home.php), and hence it is called Ousterhout’s Law.

4\. The principle of Isolation
==============================

Isolation is a key principle in building reliable systems. If two entities are properly isolated from one another, this implies that one can fail without affecting the other.

Operating systems strive to isolate processes from each other and in this way prevent one from harming the other. By using memory isolation, the OS further ensures that running programs cannot affect the operation of the underlying OS. Some modern OS’s take isolation even further, by walling off pieces of the OS from other pieces of the OS. Such microkernels thus may provide greater reliability than typical monolithic kernel designs.

5\. 1000 Solutions and one great solution
=========================================

> _If 1000 solutions exist, no great one does._

The fact that so many different algorithms exist to try to solve a common problem is indicative of a stronger underlying truth: there is no one “best” way to solve the problem. Thus, we settle for something reasonable and hope it is good enough. The only real solution is then, to avoid the problem altogether.

5a. Hybrid solution
===================

When you have two good and seemingly opposing solutions, you should always see if you can combine them into a hybrid that manages to achieve the best of both worlds. Hybrid corn species, for example, are known to be more robust than any naturally-occurring species. Of course, not all hybrids are a good idea unlike those 1000 ideas; see the [**Zeedonk**](https://www.sciencedaily.com/terms/zeedonk.htm) (or Zonkey), which is a cross of a Zebra and a Donkey.

6\. Understand the system inherent limitations
==============================================

These limitations are more fundamental laws like those of physics based on P vs NP, the speed-of-light and other physical constraints, and thus, must be properly understood and taken care of while designing the system.

6a. Understand time-space trade-offs
====================================

When building a data structure, one should always consider time-space trade-offs in its construction. Usually, if you wish to make access to a particular data structure faster, you will have to pay a space-usage penalty for the structure.

6b. Understand fallacies of distributed computing
=================================================

The [**fallacies**](https://en.wikipedia.org/wiki/Fallacy) by [**L. Peter Deutsch**](https://en.wikipedia.org/wiki/L._Peter_Deutsch) are:

1.  **The** [**network**](https://en.wikipedia.org/wiki/Computer_network) **is reliable.** Bit corruption, down or non-working links and machines, and lack of buffer space for incoming packets all lead to the same result: packets sometimes do not reach their destination, hence communication is inherently unreliable and to build reliable services on top, we must rely on protocols, that can cope up with network outages and packet loss.
2.  [**Latency**](https://en.wikipedia.org/wiki/Latency_(engineering)) **is zero.** Ignorance of network latency, and of the [**packet loss**](https://en.wikipedia.org/wiki/Packet_loss) it can cause, induces application- and transport-layer developers to allow unbounded traffic, greatly increasing dropped packets and wasting bandwidth.
3.  [**Bandwidth**](https://en.wikipedia.org/wiki/Throughput) **is infinite.** Ignorance of bandwidth limits on the part of traffic senders can result in bottlenecks over [**frequency-multiplexed**](https://en.wikipedia.org/wiki/Frequency-division_multiplexing) media.
4.  **The network is** [**secure**](https://en.wikipedia.org/wiki/Computer_security)**.** Complacency regarding network security results in being blindsided by malicious users and programs that continually adapt to security measures.
5.  [**Topology**](https://en.wikipedia.org/wiki/Network_topology) **doesn’t change.** Changes in [**network topology**](https://en.wikipedia.org/wiki/Network_topology) can have effects on both bandwidth and latency issues, and therefore similar problems.
6.  **There is one** [**administrator**](https://en.wikipedia.org/wiki/Network_administrator)**.** Multiple administrators, as with [**subnets**](https://en.wikipedia.org/wiki/Subnetwork) for rival companies, may institute conflicting policies of which senders of network traffic must be aware in order to complete their desired paths.
7.  **Transport cost is zero.** The “hidden” costs of building and maintaining a network or subnet are non-negligible and must consequently be noted in budgets to avoid vast shortfalls.
8.  **The network is homogeneous.** If a system assumes a homogeneous network, then it can lead to the same problems that result from the first three fallacies.

6c. Understand CAP theorem
==========================

In [**theoretical computer science**](https://en.wikipedia.org/wiki/Theoretical_computer_science), the **CAP theorem**, also named **Brewer’s theorem** after computer scientist [**Eric Brewer**](https://en.wikipedia.org/wiki/Eric_Brewer_(scientist)), states that it is impossible for a [**distributed data store**](https://en.wikipedia.org/wiki/Distributed_data_store) to simultaneously provide more than two out of the following three guarantees:

*   [**_Consistency_**](https://en.wikipedia.org/wiki/Consistency_(database_systems)): Every read receives the most recent write or an error
*   [**_Availability_**](https://en.wikipedia.org/wiki/Availability): Every request receives a (non-error) response — without guarantee that it contains the most recent write
*   [**_Partition tolerance_**](https://en.wikipedia.org/wiki/Network_partitioning): The system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes

In particular, the CAP theorem implies that in the presence of a network partition, one has to choose between consistency and availability.

However, CAP is frequently misunderstood as if one has to choose to abandon one of the three guarantees at all times. In fact, the choice is really between consistency and availability only when a network partition or failure happens; at all other times, no trade-off has to be made.

7\. Be wary of complexity
=========================

System designers should be wary of adding complexity into their system. What a good systems builder does is implement the least complex system that achieves the task at hand. Be wary of needless complexity, in prematurely-optimized code or other forms; such approaches make systems harder to understand, maintain, and debug.

> _Perfection is finally attained not when there is no longer anything to add, but when there is no longer anything to take away._ [Antoine de Saint-Exupery](https://en.wikipedia.org/wiki/Antoine_de_Saint-Exup%C3%A9ry)
> 
> _It’s a lot easier to say something about perfection than to actually achieve it._ [Arpaci-Dusseau, Remzi H., and Andrea C. Arpaci-Dusseau](http://pages.cs.wisc.edu/~remzi/OSTEP/)

7a. More concurrency isn’t necessarily faster
=============================================

If the scheme you design adds a lot of overhead (for example, by acquiring and releasing locks frequently, instead of once), the fact that it is more concurrent may not be important. Simple schemes tend to work well, especially if they use costly routines rarely. Adding more locks and complexity can be your downfall. All of that said, there is one way to really know: build both alternatives (simple but less concurrent, and complex but more concurrent) and measure how they do. In the end, you can’t cheat on performance; your idea is either faster, or it isn’t.

8\. Comparing against optimal is useful
=======================================

Although optimal is not very practical as a real policy, it is incredibly useful as a comparison point in simulation or other studies. Saying that your fancy new algorithm has a 80% hit rate isn’t meaningful in isolation; saying that optimal achieves an 82% hit rate (and thus your new approach is quite close to optimal) makes the result more meaningful and gives it context. Thus, in any study you perform, knowing what the optimal is lets you perform a better comparison, showing how much improvement is still possible, and also when you can stop making your policy better, because it is close enough to the ideal. Know and understand the optimal, while designing your solution.

9\. Learn, know and use your tools
==================================

You should always learn new tools that help you write, debug, and understand computer systems. Software systems are ever-evolving and the technology changes on a daily basis. Spend time to learn more about new upcoming technologies; the better you are at using your tools, the better systems you’ll be able to design and build. If you don’t keep yourself and your system updated, you and your system will slowly become [**obsolete**](https://en.wikipedia.org/wiki/Obsolescence) due to [**software rot**](https://en.wikipedia.org/wiki/Software_rot).

10\. Lauer’s Law: Less code is better code.
===========================================

Programmers tend to brag about how much code they wrote to do something. Doing so is fundamentally broken. What one should brag about, rather, is how little code one wrote to accomplish a given task. Short, concise code is always preferred; it is likely easier to understand and has fewer bugs.

> _If the same people had twice as much time, they could produce as good of a system in half the code._ [Hugh Lauer](https://www.wpi.edu/people/faculty/lauer)

We’ll call this [**Lauer**](https://www.wpi.edu/people/faculty/lauer)’s Law, and it is well worth remembering. So next time you’re bragging about how much code you wrote to finish the assignment, think again, or better yet, go back, rewrite, and make the code as clear and concise as possible.

11\. Hill’s Law: Simple and Dumb can be better.
===============================================

You should never underestimate the notion that the simple and dumb approach can be the best one. Thus, always try the simple and dumb approach first. This idea, of appealing to simplicity, is found in many places. One early source is [**Mark Hill**](http://pages.cs.wisc.edu/~markhill/) ‘s dissertation, which studied how to design caches for CPUs. Hill found that simple direct-mapped caches worked better than fancy set-associative designs (one reason is that in caching, simpler designs enable faster lookups). As Hill succinctly summarized his work:

> _Big and dumb is better._ [Mark Hill](http://pages.cs.wisc.edu/~markhill/)

And thus we call this similar advice Hill’s Law.

12\. Tom West’s Law: Don’t always do it perfectly.
==================================================

Tom West, famous as the subject of the classic computer-industry book Soul of a NewMachine, says famously:

> _Not everything worth doing is worth doing well._ [Tom West](https://en.wikipedia.org/wiki/Tom_West)

which is a terrific engineering maxim. If a bad thing happens rarely in the system, certainly one should not spend a great deal of effort to prevent it, particularly if the cost of the bad thing occurring is small. If, on the other hand, you are building a space shuttle, and the cost of something going wrong is the space shuttle blowing up, well, perhaps you should ignore this piece of advice.

12a. Voltaire’s Law: Perfect is the enemy of the good.
======================================================

Even when you design a beautiful system, sometimes all the corner cases don’t work out exactly as you might like. Thus, accepting that life isn’t perfect and still building the system is a sign of good engineering.

> _Il meglio è nemico del bene._ [Voltaire](https://en.wikipedia.org/wiki/Voltaire)

13\. Livny’s Law : It always depends.
=====================================

Almost any question can be answered with “it depends”, as [**Miron Livny**](http://pages.cs.wisc.edu/~miron/) always says. Leave out the unnecessary requirements and over specification with such clauses as it always depends on the future requirements and changes.

However, use this with caution, as if you answer too many questions this way, people will stop asking you questions altogether. For example, somebody asks: “want to go to lunch?” You reply: “it depends, are you coming along?”

14\. Subtle important things matter
===================================

14a. Naming matters.
====================

> _There are only two hard things in Computer Science: cache invalidation and naming things._ [Phil Karlton](http://www.meerkat.com/karlton/)

Naming is an important aspect of computer systems and getting the right name is a difficult challenge (ask any programmer). This uniformity of naming eases your conceptual model of the system, and makes the system simpler and more modular. Thus, whenever creating a system or interface, think carefully about what names you are using. They have to be uniform, consistent, simple and intuitive to the users.

14b. Usability matters.
=======================

A lot of products and systems are pleasing to look, offer great feature and are even, technologically innovative but are rarely of any use. Such systems and products tend to push the users away by making them frustrated and annoyed. Making a system usable is often as or more important than its deep technical innovations, which should be incorporated from the design phase itself.

14c. Details matter.
====================

All interesting systems are comprised of a few general ideas and a number of details. Sometimes, when you are designing the systems, you think to yourself “Oh, I get the general idea; the rest is just details to be figured while implementation,” and then, you are doing disservice to the implementor or programmer. Don’t do this! Many times, the details are critical. While designing a system, the general idea is easy to understand, but to really build a working system, you have to think through all of the tricky cases.

15\. Turn flaws into virtues
============================

> _It is not a bug, it is a feature._

Whenever your system has a fundamental flaw or limitation, see if you can turn it around into a feature or something useful. There are multiple examples of great engineering designs, that provide cool feature on top of a flaw, removing the problem all together with a wonderful twist.

16\. Compatibility and Deployment
=================================

16a. The importance of backward compatibility
=============================================

Backwards compatibility is always a concern in layered systems. By defining a stable interface between two systems, one enables innovation on each side of the interface while ensuring continued interoperability. Such an approach has been quite successful in many domains: operating systems have relatively stable APIs for applications, disks provide the same block-based interface to file systems, and each layer in the IP networking stack provides a fixed unchanging interface to the layer above. Not surprisingly, there can be a downside to such rigidity, as interfaces defined in one generation may not be appropriate in the next. In some cases, it may be useful to think about redesigning the entire system entirely.

16b. Transparency enables deployment
====================================

When considering how to add new functionality to a system, one should always consider whether such functionality can be added transparently, in a way that demands no changes to the rest of the system. Requiring a complete rewrite of the existing software (or radical hardware changes) lessens the chance of impact of an idea.

17\. Patterson’s law: Measure then build.
=========================================

[**David Patterson**](https://en.wikipedia.org/wiki/David_Patterson_(computer_scientist)) (of RISC and RAID fame), used to always encourage his students to measure a system and demonstrate a problem before building a new system to fix said problem. Thus, we call it Patterson’s law.

By using experimental evidence, rather than gut instinct, you can turn the process of system building into a more scientific endeavor. Doing so also has the fringe benefit of making you think about how exactly to measure the system before your improved version is developed. When you do finally get around to building the new system, two things are better as a result: first, you have evidence that shows you are solving a real problem; second, you now have a way to measure your new system in place, to show that it actually improves upon the state of the art.

Epilogue
========

In the end, it all boils down to one realization for systems, [**TANSTAAFL**](https://en.wikipedia.org/wiki/There_ain%27t_no_such_thing_as_a_free_lunch)**.**

> **There Ain’t No Such Thing As A Free Lunch.**

The system design will always present with the most interesting and challenging [**trade-offs**](https://en.wikipedia.org/wiki/Trade-off), and a system designer should be aware of the hidden costs and well-equipped to get it right, not perfect!

Navigation
==========

This article is part of the series on [**System Manifesto : Wisdom, Philosophy and Principles**](https://medium.com/@jayanthj/systems-manifesto-wisdom-philosophy-and-principles-17bd70317586).

In this series of System Manifesto, the other sections are:

*   [**Philosophy of Systems Implementation**](https://medium.com/@jayanthj/philosophy-of-systems-implementation-a24ec5233cf4)
*   [**Principles for Systems Optimization**](https://medium.com/@jayanthj/principles-for-systems-optimization-61226f140fca)

Reference
=========

1.  Varghese, George. _Network algorithmics_. Chapman & Hall/CRC, 2010.
2.  Raymond, Eric S. _The art of Unix programming_. Addison-Wesley Professional, 2003.
3.  Arpaci-Dusseau, Remzi H., and Andrea C. Arpaci-Dusseau. _Operating systems: Three easy pieces_. Vol. 151. Wisconsin: Arpaci-Dusseau Books, 2014.
4.  Lampson, Butler W. “Hints for computer system design.” _ACM SIGOPS Operating Systems Review_. Vol. 17. №5. ACM, 1983.
5.  Hunt, Andrew, David Thomas, and Ward Cunningham. _The pragmatic programmer: from journeyman to master_. Addison-Wesley Professional, 2000.

_Originally published at_ [_https://www.linkedin.com_](http://linkedin.com/pulse/wisdom-systems-design-jayanth-jayanth/) _on June 24, 2018._
