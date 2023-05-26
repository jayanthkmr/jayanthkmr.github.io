---
layout: post
author: Jayanth Kumar
title: Serverless Microservices
date: 2022-05-07 06:18:05 UTC
background: //cdn-images-1.medium.com/max/740/0*58hUDDT5fp4oTrWU
---

#### Building server-less micro-services application — a small walkthrough!

### Prologue

So, your cloud enterprise software is siloed into [loosely coupled](https://en.wikipedia.org/wiki/Loose_coupling) smaller pieces and then, run as a collection of smaller parts instead of one monolithic whole. Good Job! Basically, you have adopted the [microservices architecture](https://en.wikipedia.org/wiki/Microservices), where each piece of your application performs a smaller set of services and runs independently of the other part of the application and operates in its own environment and stores its own data. But, then you have multiple servers on the cloud to take care of and multiple databases to manage. So here comes the&nbsp;problem:

### The Problem

So, you have rented the fixed units of server space from your cloud provider, generally over-purchase to ensure that a spike in traffic or activity wouldn’t exceed your monthly limits and break your microservices.

Then, the accounts department comes in, asking an explanation of the cloud provider’s expense&nbsp;report.

![](https://cdn-images-1.medium.com/max/1024/0*3TTDvKnn9sKyQyp_)

Also, as you add more services and glue them together, you start worrying about their scalability. You try to realize the [scaling on demand,](https://en.wikipedia.org/wiki/Autoscaling) which your cloud provider promised but you are then, stuck into writing scaling policies in some archaic language that your cloud vendor supports or learning a completely new language paradigm that a framework promises to support for your cloud&nbsp;vendor.

### The Solution

Enter the serverless paradigm, where you are charged based on the computation and do not have to reserve and pay for a fixed amount of bandwidth or number of servers, as the service is auto-scaling. You then, write your services as functions, [FaaS](https://en.wikipedia.org/wiki/Function_as_a_service) and stop worrying about managing your resources and autoscaling.

Another benefit that comes out of the box is the software developer does not have to worry about [multithreading](https://en.wikipedia.org/wiki/Multithreading_(software)) or directly handling [HTTP](https://en.wikipedia.org/wiki/HTTP) requests in their code, simplifying the task of back-end software development.

Next, you pick up the serverless database as you have to deploy multiple databases in the backend, not all databases need to be live and should automatically start up, shut down, and scale capacity up or down based on the service’s needs.

And finally, you pay as you go! The accounts team is happy, you are happy and everyone is&nbsp;happy!

### The Realization

Serverless Microservices application can be realized end-to-end as let’s say on AWS&nbsp;:

- [Lambda](https://aws.amazon.com/lambda/) _cloud native_ functions for compute&nbsp;services
- [Simple Notification Service](https://aws.amazon.com/sns/) for event pub/sub-functions as&nbsp;services
- [Simple Queue Service](https://aws.amazon.com/sqs/) for queue functions as&nbsp;services
- [CloudWatch Events](https://docs.aws.amazon.com/lambda/latest/dg/with-scheduled-events.html) for scheduled functions as&nbsp;services
- [Aurora Serverless](https://aws.amazon.com/rds/aurora/serverless/)/[DynamoDB](https://aws.amazon.com/dynamodb/) for data persistence, querying and trigger functions
- [API Gateway](https://aws.amazon.com/api-gateway/) for&nbsp;HTTP
- [Route53](https://aws.amazon.com/route53) for&nbsp;DNS
- [CloudFront](https://aws.amazon.com/cloudfront/) for&nbsp;CDN
- [CloudFormation](https://aws.amazon.com/cloudformation/) for packaging deployments
- [S3](https://aws.amazon.com/s3/) for static&nbsp;assets
- [Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html) for environment variables

![](https://cdn-images-1.medium.com/max/1024/0*5yhUCKvZ3ctlkxYi)

### Epilogue

So, you have divided the monolithic applications into microservices, all integrated by [loose coupling](https://en.wikipedia.org/wiki/Loose_coupling) into separate micro-applications. Now is the time to convert these microservices into serverless functions as a service and then, deploy them in a serverless architecture. You should even, break the frontend into micro-frontends and serve them separately to make it complete micro-application. Refer [my previous article](https://medium.com/@jayanthj/demystifying-%CE%BC-frontends-c0431c74858c) on micro-frontends for such micro-services based backend to make a complete micro-application based architechture.

> _Solve the problem once, use the solution everywhere!_

 ![](https://medium.com/_/stat?event=post.clientViewed&referrerSource=full_rss&postId=ea465c439183)
* * *

[Serverless Microservices](https://blog.jaykmr.com/serverless-microservices-ea465c439183) was originally published in [Technopreneurial Treatises](https://blog.jaykmr.com) on Medium, where people are continuing the conversation by highlighting and responding to this story.

