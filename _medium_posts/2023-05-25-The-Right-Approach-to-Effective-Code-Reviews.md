---
layout: post
author: Jayanth Kumar
title: The Right Approach to Effective Code Reviews
date: 2023-05-25 19:02:02 UTC
background: //cdn-images-1.medium.com/max/960/1*PeMyG4kC8cMgYtLjwjFN_A.png
---

### Prologue

So, you have inculcated the “right attitude” for software engineering after reading [my old article — The Right Approach to Software Engineering](https://medium.com/technopreneurial-treatises/the-right-approach-to-software-engineering-57f0b0fbb8e) but you are working in a silo in a small team or a startup, churning a lot of code. You start wondering whether you are making the right architectural decisions, producing good-quality code, and properly, maintaining the software, that you are building. You often face the same set of operational issues after deploying, which makes you revisit your repository, relook at the code, check the code quality using code analyzers like [Codacy](https://go.codacy.com/code-analysis) and [SonarQube](https://www.sonarsource.com/products/sonarqube/), and then, realize the&nbsp;problem:

### Problem

You have been churning out poor-quality code, with the same set of design issues, inconsistent style, and bugs, all adding up to a lot of technical debt. Now, you want to improve your technical know-how, improve the software quality as well as reduce the technical debt of the code, you are churning&nbsp;out.

[Software Engineers](https://en.wikipedia.org/wiki/Software_engineering), when working in silos end up producing poor-quality code and struggle with learning patterns and anti-patterns of software design. Without the right guidance and review of your common design issues, errors, and bugs, you end up making the same code quality mistakes again and again, which eventually adds to the [technical debt](https://en.wikipedia.org/wiki/Technical_debt) and poor [software maintainability](https://en.wikipedia.org/wiki/Software_maintenance).

### Solution

If you are working in a team, you should definitely do **_code reviews_** to improve both your own skills and the quality of the codebase and foster knowledge sharing and collaboration, contributing to a positive development culture.

Let’s understand what, why, and how of effective code&nbsp;reviews.

#### What is code&nbsp;review?

![](https://cdn-images-1.medium.com/max/640/0*1h9f0vnXph1zQCae)
_Code Mocking — An Engineering Tradition (credits: Dilbert comics)_

Code review is a process in software development where one or more developers systematically examine and evaluate the code written by their peers. It involves reviewing the code for quality, correctness, adherence to coding standards, best practices, and overall maintainability. Code reviews are typically conducted before merging code changes into a shared codebase, aiming to catch bugs, improve code design, identify potential issues, and ensure that the code meets the requirements and expectations of the project. The goal of code review is to enhance the overall code quality, promote collaboration and learning within the development team, and ultimately deliver reliable and maintainable software.

#### Why do code&nbsp;reviews?

![](https://cdn-images-1.medium.com/max/717/0*3a9i2aXv7ojAFPNk)
_Wanna see the code (credits: xkcd comics)_

Code reviews serve several important purposes in software development:

1. **Bug Detection** : Code reviews help identify bugs, logic errors, and other issues in the code before they reach production. Reviewers can catch mistakes that the original developer might have missed, leading to higher quality and more reliable software.

2. **Knowledge Sharing and Learning** : Code reviews provide an opportunity for developers to learn from each other. Reviewers can share their expertise, suggest improvements, and introduce new techniques or best practices. It promotes collaboration within the team and helps in spreading knowledge across the organization.

3. **Code Quality and Consistency** : Code reviews help maintain a high level of code quality and consistency throughout the codebase. By following coding standards, best practices, and design patterns, reviewers can ensure that the codebase is maintainable, readable, and adheres to the established guidelines.

4. **Continuous Improvement** : Code reviews foster a culture of continuous improvement. Through constructive feedback and discussions, developers can refine their coding skills, enhance their understanding of the project, and identify areas where they can improve their&nbsp;code.

5. **Team Building and Accountability** : Code reviews encourage collaboration and team building within the development team. It creates a shared responsibility for the codebase, as developers review each other’s work and provide feedback. It also helps establish a sense of accountability, as developers are held responsible for the quality and reliability of their&nbsp;code.

Overall, code reviews contribute to better software quality, improved developer skills, and a more cohesive and efficient development process.

> _It’s better to succeed together than to fail&nbsp;alone._

#### How to comment the&nbsp;code?

![](https://cdn-images-1.medium.com/max/740/0*zN_XgrNKdxnFoLY6)
_Bad code (credits: xkcd comics)_

Commenting code is an essential practice in software development as it helps improve code readability, maintainability, and understanding. Here are some guidelines for effective code commenting:

1. **Use Clear and Concise Comments** : Write comments that are easy to understand and concise. Avoid ambiguous or vague comments that can lead to confusion. Comment only where necessary and focus on explaining the intent or purpose of the&nbsp;code.

2. **Comment Purpose and High-Level Logic** : Comment on the overall purpose and functionality of the code block or function. Explain the high-level logic and any important decisions made during the implementation. This helps other developers understand the code’s intent without diving into the implementation details.

3. **Document Complex or Non-Obvious Code** : If the code contains complex algorithms, non-trivial logic, or intricate business rules, provide comments to explain how it works. This helps other developers, including your future self, comprehend the code more&nbsp;easily.

4. **Use Self-Explanatory Variable and Function Names** : Naming variables and functions descriptively can eliminate the need for excessive comments. When code is self-explanatory, it becomes easier to understand without relying heavily on comments.

5. **Comment Tricky or Non-Standard Code** : If you encounter code that deviates from standard practices or uses workarounds, provide comments to explain the reason behind it. This helps prevent others from mistakenly considering it as an error or making unnecessary changes.

6. **Update Comments with Code Changes** : When you modify code, ensure that you update the corresponding comments to reflect the changes accurately. Outdated comments can be misleading and cause confusion.

7. **Avoid Redundant Comments** : Avoid commenting on obvious code or duplicating information that is already apparent from the code itself. Redundant comments can clutter the code and make it harder to&nbsp;read.

8. **Use Comment Styles Consistently** : Follow consistent comment styles and formatting conventions throughout the codebase. This helps maintain a unified and organized appearance.

Remember that comments should complement the code and provide valuable information that enhances understanding. Well-placed and meaningful comments can significantly improve the readability and maintainability of your codebase.

> _There are only two hard things in Computer Science: cache invalidation and naming&nbsp;things._

#### How can it help me as a developer to do code reviews of other developers?

![](https://cdn-images-1.medium.com/max/740/0*MWAuYpm5CBT5xNmM)
_Code Quality (credits: xkcd comics)_

Performing code reviews of other developers’ work can greatly benefit you as a developer in several&nbsp;ways:

1. **Enhancing Code Quality** : Code reviews provide an opportunity to identify and address potential issues, bugs, or inefficiencies in the codebase. By reviewing other developers’ code, you can catch mistakes or suggest improvements, leading to higher code&nbsp;quality.

2. **Learning Opportunities** : Code reviews expose you to different coding styles, techniques, and problem-solving approaches. You can learn from the strengths and weaknesses of others’ code, gaining insights into new patterns, best practices, and innovative solutions.

3. **Collaboration and Teamwork** : Code reviews promote collaboration and foster a sense of shared responsibility within the development team. Through the review process, you can engage in constructive discussions, share knowledge, and work together to improve the overall codebase.

4. **Consistency and Standards** : Code reviews help maintain consistency and adherence to coding standards across the project. By reviewing code, you can ensure that the codebase follows established guidelines, naming conventions, formatting rules, and other project-specific requirements.

5. **Knowledge Sharing** : Code reviews facilitate knowledge sharing among team members. As you review the code, you can provide explanations, suggest alternative approaches, and offer guidance. This sharing of knowledge benefits both the developer whose code is being reviewed and the reviewer.

6. **Identifying Patterns and Anti-patterns** : Code reviews allow you to identify recurring patterns or anti-patterns in the codebase. By recognizing such patterns, you can propose refactoring opportunities, suggest code reuse, or identify areas where design patterns can be&nbsp;applied.

7. **Error Prevention** : Code reviews act as a preventive measure against introducing bugs or issues into the codebase. By thoroughly reviewing code, you can identify potential pitfalls, evaluate edge cases, and spot logic errors before they reach the production environment.

8. **Continuous Improvement** : Code reviews promote a culture of continuous improvement within the development team. By providing constructive feedback and suggestions, you contribute to the growth of individual developers and the overall team’s&nbsp;skills.

By actively participating in code reviews, you can contribute to a positive development culture and improve both your own skills and the quality of the codebase.

> _The more you help people, the stronger you&nbsp;get._

#### How should I do code reviews? How to learn&nbsp;it?

![](https://cdn-images-1.medium.com/max/531/0*QZsunCYtj5vNlKXD)
_Code Quality 2 (credits: xkcd comics)_

To effectively conduct code reviews, consider the following steps and&nbsp;tips:

1. **Set clear expectations** : Establish guidelines and standards for code reviews within your team or organization. Define the goals of code reviews, the scope of review, and the expected timeline.

2. **Review the code independently** : Start by examining the code on your own, without any distractions. Understand the purpose, functionality, and design choices made in the&nbsp;code.

3. **Follow a checklist** : Use a checklist or a set of predefined criteria to ensure thoroughness and consistency in your code reviews. This can include aspects like code style, readability, performance, security, error handling, and adherence to best practices. For example, check for [code smells](https://refactoring.guru/refactoring/smells) and then, resolve [code smells](https://refactoring.guru/refactoring/smells) using [refactoring techniques](https://refactoring.guru/refactoring/techniques).

4. **Provide constructive feedback** : When you identify areas for improvement, offer clear and specific feedback. Explain the issues you’ve found and suggest possible solutions or alternative approaches.

5. **Prioritize and categorize feedback** : Differentiate between critical issues that need immediate attention and minor suggestions for improvement. Organize your feedback to help the developer understand the importance and impact of each&nbsp;comment.

6. **Be objective and impartial** : Focus on the quality of the code and adherence to established standards, rather than personal preferences. Base your feedback on objective criteria and best practices.

7. **Balance between nitpicking and high-level feedback** : While it’s important to catch small issues, also provide feedback on the overall design, architecture, and problem-solving approach. Find the right balance between detailed suggestions and high-level guidance.

8. **Foster collaboration and learning** : Code reviews should be seen as an opportunity for growth and knowledge sharing. Encourage open discussions, ask questions, and be receptive to different perspectives. Promote a culture of continuous learning and improvement.

9. **Document your feedback** : Keep a record of the feedback you provide, either through comments in the code review tool or in a separate document. This helps track progress and allows developers to refer back to the feedback.

10. **Learn from others** : Participate in code reviews of your peers and learn from their feedback. Observe how experienced reviewers provide suggestions and explanations. Seek feedback on your own code to enhance your skills and understanding.

11. **Practice and seek feedback** : The more you engage in code reviews, the better you’ll become. Practice regularly and seek feedback from both developers and reviewers to improve your code review&nbsp;skills.

12. **Learn from resources and training** : Explore online resources, articles, books, and courses on code review best practices. Some organizations also offer internal training or mentorship programs to enhance code review skills. Take advantage of these resources to deepen your knowledge.

By following these steps and continuously learning and practicing from the experience, you can become an effective code reviewer.

> _Practice makes a man&nbsp;perfect._

#### How to convey messages politely in code&nbsp;reviews?

![](https://cdn-images-1.medium.com/max/740/0*DKO7KM40tBJXM1V5)
_Code Quality 3 (credits: xkcd comics)_

When conveying messages politely in code reviews, it’s important to consider the following guidelines:

1. **Use a friendly and constructive tone** : Frame your feedback in a positive and encouraging manner. Instead of simply pointing out flaws, offer suggestions for improvement.

2. **Start with positive feedback** : Begin by acknowledging the strengths or good aspects of the code. This helps create a positive atmosphere and shows appreciation for the developer’s efforts.

3. **Be specific and objective** : Clearly articulate the issues you’ve identified or the improvements you suggest. Use specific examples from the code to illustrate your points. Avoid vague or general statements.

4. **Focus on the code, not the developer** : Critique the code itself rather than to criticize the developer personally. Remember that the goal is to improve the code, not to attack the individual who wrote&nbsp;it.

5. **Offer alternatives or solutions** : Instead of simply pointing out problems, provide alternative approaches or solutions. This demonstrates your willingness to help and encourages collaboration.

6. **Use constructive language** : Frame your feedback in a way that promotes learning and growth. Use phrases like “Have you considered…” or “What if we tried…” to encourage dialogue and exploration of different options.

7. **Be respectful and empathetic** : Keep in mind that behind every line of code is a developer who invested time and effort. Show empathy and respect for their work while providing suggestions for improvement.

8. **Provide context and explanations** : When suggesting changes or improvements, explain the reasoning behind your suggestions. Help the developer understand why a certain approach may be more beneficial.

9. **Focus on the bigger picture** : Consider the overall goals of the project and the team. Align your feedback with those goals and emphasize how the suggested changes contribute to the project’s success.

10. **Follow up with support** : Offer assistance and clarification if the developer has questions or needs further guidance. Engage in a constructive dialogue to ensure that the feedback is well understood.

By conveying messages politely and constructively, you create a positive and collaborative environment for growth and development.

> _There is a very thin line between hand-holding and spoon-feeding. Spoon feed an infant, but hand hold an&nbsp;adult._

### Epilogue

So, to be an effective software engineer, it is necessary to be an effective code reviewer and also, get your code reviewed. In quality control, [Four competent eyes](https://www.openriskmanual.org/wiki/Four_Eyes_Principle) are always better than two. After all, software engineering is a collaborative and creative learning process, not a siloed&nbsp;labor.

> _Being a great engineer is all about having the right attitude._

 ![](https://medium.com/_/stat?event=post.clientViewed&referrerSource=full_rss&postId=88a675469199)
* * *

[The Right Approach to Effective Code Reviews](https://blog.jaykmr.com/the-right-approach-to-effective-code-reviews-88a675469199) was originally published in [Technopreneurial Treatises](https://blog.jaykmr.com) on Medium, where people are continuing the conversation by highlighting and responding to this story.

