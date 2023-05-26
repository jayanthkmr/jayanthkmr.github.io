---
layout: post
author: Jayanth Kumar
title: Standardizing RESTful APIs
link: https://blog.jaykmr.com/standardizing-restful-apis-7f0b94d12d05?source=rss----5c34e71e048---4
date: 2022-08-20 15:06:28 UTC
background: //cdn-images-1.medium.com/max/960/1*R7pUZKRytt4q9_PC4xmzwQ.png
---

Consistent, hierarchical, and modular&nbsp;APIs

### Prologue

![](https://cdn-images-1.medium.com/max/650/0*bk8jrdJN31OAKK7I)

So, you have decided to build your enterprise application as [loosely coupled](https://en.wikipedia.org/wiki/Loose_coupling) micro-services, even thinking of making them [serverless](https://en.wikipedia.org/wiki/Serverless_computing) after reading [my old article — Serverless Microservices](https://blog.jaykmr.com/serverless-microservices-ea465c439183) and after coming across [REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api), you have decided to build your application APIs conforming to REST architectural style. Good Job! Basically, you have adopted the [microservices architecture](https://en.wikipedia.org/wiki/Microservices), where each piece of your application performs a smaller set of services and runs independently of the other part of the application and operates in its own environment and stores its own data and communicates/interacts with other services via [REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api). But, then you have multiple REST APIs in your services to take care of and provide to the customers, especially if you are opening your services to third-parties. So here comes the&nbsp;problem:

### The Problem

When you let your micro-service teams to adopt to REST, they all come up with their own standards and conventions of doing things. Eventually, there is pandemonium, when clients and customers are not able to follow the REST APIs, designed for your enterprise services as each API is designed in its own unique style. When you, as an architect or team lead go ahead to discuss this problem with your micro-services development team, you get the following response.

![](https://cdn-images-1.medium.com/max/228/0*ud712NOSVsi4NB0B)

Also, as your team adds more REST services and glue them together, you start worrying more about their standardisation and presentation as you never had put any convention in place. Now, you try to realize the problem of standardizing your RESTful APIs and wished for better and sane practices from the start. After all, migrating all your clients and customers on the new standard version of APIs won’t be an easy&nbsp;task.

### The Definitions

You look at the REST API specification from the first principles and start by understanding what all its underlying syntax is customisable and can be standardized.

**API ** — An API is a set of definitions and protocols for building and integrating application software, referred to as a contract between an information provider and an information user — establishing the content required from the consumer (the call) and the content required by the producer (the response).

The advantage of using APIs is that as a resource consumer, you are decoupled from the producer and you don’t have to worry about how the resource is retrieved or where it comes from. It also helps an organization to share resources and information while maintaining security, control, and authentication — determining who gets access to&nbsp;what.

**REST**  — REST stands for **REpresentational State Transfer** and was created by computer scientist Roy Fielding. REST is a set of architectural constraints, not a protocol or a standard. When a client request is made via a RESTful API, it transfers a representation of the state of the resource to the requester or endpoint in one of several formats via HTTP: [JSON](https://en.wikipedia.org/wiki/JSON), [HTML](https://en.wikipedia.org/wiki/HTML), [XML](https://en.wikipedia.org/wiki/XML), plain text&nbsp;etc.

In order for an API to be considered RESTful, it has to conform to these criteria:

1. A [**client-server architecture**](https://en.wikipedia.org/wiki/Client%E2%80%93server_model) made up of clients, servers, and resources, with requests managed through&nbsp;HTTP.
2. [**Stateless**](https://en.wikipedia.org/wiki/Stateless_protocol) client-server communication, meaning no client information is stored between get requests and each request is separate and unconnected.
3. [**Cacheable**](https://en.wikipedia.org/wiki/Cache_(computing)) data that streamlines client-server interactions.
4. A [**uniform interface**](https://www.oreilly.com/library/view/restful-web-services/9780596809140/ch01.html) between components so that information is transferred in a standard form. This requires&nbsp;that:

- resources requested are identifiable and separate from the representations sent to the&nbsp;client.
- resources can be manipulated by the client via the representation they receive because the representation contains enough information to do&nbsp;so.
- self-descriptive messages returned to the client have enough information to describe how the client should process&nbsp;it.
- hypertext/hypermedia is available, meaning that after accessing a resource the client should be able to use hyperlinks to find all other currently available actions they can&nbsp;take.

5. A [**layered system**](https://en.wikipedia.org/wiki/Layered_system) that organizes each type of server (those responsible for security, load-balancing, etc.) involved the retrieval of requested information into hierarchies, invisible to the&nbsp;client.

6. [**Code-on-demand**](https://en.wikipedia.org/wiki/Code_on_demand) (optional): the ability to send executable code from the server to the client when requested, extending client functionality.

API developers can implement REST in a variety of ways, which sometimes leads to chaos, especially when the syntactic schema for REST across multiple API development teams are not aligned and standardised. So, in next sections, the evaluation criteria for evaluating and suggestions to standardize REST APIs is presented to evade this&nbsp;chaos.

### REST API Evaluation Criteria

The REST APIs should be holistically evaluated and improved based on the following criteria:

1. **Resource Oriented&nbsp;Design**
2. **Standard Methods**
3. **Custom Methods**
4. **Standard Fields and Query Parameters**
5. **Success &&nbsp;Errors**
6. **Naming Conventions**
7. **Important Patterns**

### Resource Oriented&nbsp;Design

The API should define a hierarchy, where each node is either a collection or a resource.

● A collection contains a list of resources of the same type. For example, a device type has a collection of&nbsp;devices.

● A resource has some state and zero or more sub-resources. Each sub-resource can be either a simple resource or a collection. For example, a device resource has a singleton resource state (say, on or off) as well as a collection of changes (change&nbsp;log).

A specific use case, the singleton resource can be used when only a single instance of a resource exists within its parent resource (or within the API, if it has no&nbsp;parent).

Here is a suggestion for simple and consistent API hierarchy:

    Collection : device-types

    Resource: device-types/{dt-id}

    Singleton Resource: device-types/{dt-id}/state-machine

    Collection: device-types/{dt-id}/attributes

    Resource: device-types/{dt-id}/attributes/{attribute-id}

    Collection: device-types/{dt-id}/changes

    Resource: device-types/{dt-id}/changes/{change-id}

    Collection: device-types/{dt-id}/devices

    Resource: device-types/{dt-id}/devices/{d-id}

    Singleton Resource: device-types/{dt-id}/devices/{d-id}/state

    Custom Method: device-types/{dt-id}/devices/{d-id}/state:transition

    Collection: device-types/{dt-id}/devices/{d-id}/changes

    Resource: device-types/{dt-id}/devices/{d-id}/changes/{change-id}s

Note that in the above, id can be string for name, number or even UUID based on agreed convention. Example:

    [https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s](https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s)

### Standard Methods

The API should support standard methods for LCRUD (List, Create, Read, Update and delete) on the nodes in the API hierarchy.

The common HTTP methods used by most RESTful web APIs&nbsp;are:

- [**GET**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) retrieves a representation of the resource at the specified URI. The body of the response message contains the details of the requested resource.
- [**POST**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) creates a new resource at the specified URI. The body of the request message provides the details of the new resource. Note that POST can also be used to trigger operations that don’t actually create resources.
- [**PUT**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) either creates or replaces the resource at the specified URI. The body of the request message specifies the resource to be created or&nbsp;updated.
- [**PATCH**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH) performs a partial update of a resource. The request body specifies the set of changes to apply to the resource.
- [**DELETE**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) removes the resource at the specified URI.

The following table describes how to map standard methods to HTTP&nbsp;methods:

1. Standard Method&nbsp;:&nbsp;[**List**](https://cloud.google.com/apis/design/standard_methods#list)

HTTP Mapping: GET \<collection URL\>

HTTP Request Body:&nbsp;NA

HTTP Response Body: Resource\* list

2. Standard Method&nbsp;:&nbsp;[**Read**](https://cloud.google.com/apis/design/standard_methods#get)

HTTP Mapping: GET \<resource URL\>

HTTP Request Body:&nbsp;NA

HTTP Response Body: Resource\*

3. Standard Method&nbsp;:&nbsp;[**Create**](https://cloud.google.com/apis/design/standard_methods#create)

HTTP Mapping: POST \<collection URL\>

HTTP Request Body:&nbsp;Resource

HTTP Response Body: Resource\*

4. Standard Method&nbsp;:&nbsp;[**Update**](https://cloud.google.com/apis/design/standard_methods#update)

HTTP Mapping: PUT or PATCH \<resource URL\>

HTTP Request Body:&nbsp;Resource

HTTP Response Body: Resource\*

5. Standard Method&nbsp;:&nbsp;[**Delete**](https://cloud.google.com/apis/design/standard_methods#delete)

HTTP Mapping: DELETE \<resource URL\>

HTTP Request Body:&nbsp;NA

HTTP Response Body:&nbsp;NA

Based on the requirements, some or all of the above API methods for the node hierarchy should be supported. Note that the \* marked resource data will be encapsulated inside the response body format containing status, request and&nbsp;data.

Here are the differences between POST, PUT, and PATCH for their usage in&nbsp;REST:

- A **POST** request **creates** a resource. The server assigns a URI for the new resource, and returns that URI to the client. In the REST model, POST request is generally applied to collections and the new resource is added to the collection. A POST request can also be used to submit data for processing to an existing resource as a custom method, without any new resource being&nbsp;created.
- A **PUT** request creates a resource or **updates** an existing resource. The client specifies the URI for the resource to be created or updated with the complete representation of the resource. If a resource with this URI already exists, it is replaced, else a new resource is created, if the server supports doing so. Whether to support creation via PUT depends on whether the client can meaningfully assign a URI to a resource before it exists. If not, then use POST to create resources and PUT or PATCH to&nbsp;update.
- A **PATCH** request performs a **partial update** to an existing resource. The client specifies the URI for the resource with the set of changes to apply to the resource. This can be more efficient than using PUT, because the client only sends the changes, not the entire representation of the resource. Technically, PATCH can also create a new resource (by specifying a set of updates to a “null” resource), if the server supports this but again, that is an anti-pattern.

PUT requests must be idempotent but POST and PATCH requests are not guaranteed to be idempotent. If a client submits the same PUT request multiple times, the results should always be the same (the same resource will be modified with the same set of&nbsp;values).

### Custom Methods

Custom methods refer to API methods besides the above 5 standard methods for functionality that cannot be easily expressed via standard methods. One of the custom functionality is the state transition of devices based on API requests. The corresponding API can be modelled either of the following ways:

1. Based on [Stripe invoice workflow design](https://stripe.com/docs/invoicing/overview#invoice-status-transition-endpoints-and-webhooks): Use / to separate the custom verb. Note that this might confuse it with resource&nbsp;noun.

    [https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s/state/ring](https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s/state/ring)

2. Based on [Google Cloud API design](https://cloud.google.com/apis/design/custom_methods): Use&nbsp;: instead of / to separate the custom verb from the resource name so as to support arbitrary paths.

    [https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s/state:ring](https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s/state:ring)

In either of the above ways, the API should use HTTP POST verb since it has the most flexible semantics.

### Standard Fields and Query Parameters

Resources may have the following standard&nbsp;fields:

- _id_
- _createdAt_
- _createdBy_
- _updatedAt_
- _updatedBy_
- _name_
- _displayName_
- _timeZone_
- _regionCode_
- _languageCode_

Note that _displayName, timeZone, regionCode, languageCode_ etc are useful, when you want to provide localizations in your&nbsp;API.

Collections may have also have standard fields like _totalCount_ in metadata.

Collections List API may have the following standard query parameters (with alternate names):

- _filter/query_
- _orderBy_
- _select/fields/view_
- _limit/top/pageSize_
- _offset/start_
- _format (json,&nbsp;xml)_
- _validate_

The standard query parameters can be separated from custom query parameters by preceding them with $.&nbsp;Example:

    [https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices?$orderBy=volume&owner=jaykmr&$format=json](https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices?$orderBy=volume&owner=jaykmr&$format=json)

### Success &&nbsp;Errors

Success & Errors across all the methods should be consistent, i.e. have same standard structure, for&nbsp;example:

    {
    "status":{

    "code":"",

    "description":"",

    "additionalInfo":""

    },

    "request":{

    "id":"",

    "uri":"",

    "queryString":"",

    "body":""

    },

    "data":{

    "meta":{

    "totalCount":"",

    ...

    },

    "values":{

    "id":"",

    "url":"",

    ...

    }

    }

    }

All the API should have a common response structure and this can be achieved by using a common response formatter in the code for resource methods. Note, in case of success, when no data is returned, the API response can either return empty list [] for collection or empty object {} for resource, while in case of error, can just return data as null to keep a consistent response schema across&nbsp;methods.

### Naming Conventions

![](https://cdn-images-1.medium.com/max/1024/0*LjKxGSnwBVpbu29u)

Here are my suggestions on the naming conventions without the intention of provoking tabs vs spaces kind of&nbsp;debate:

● Collection and Resource names should use unabbreviated plural form and kebab&nbsp;case.

● Field names and query parameters should use lowerCamel case.

● Enums should use Pascal case&nbsp;names.

● Custom Methods should use lowerCamel case names. (example: batchGet)

There are multiple good suggestions like [Google API Naming Convention](https://cloud.google.com/apis/design/naming_convention) but this depends on the organization, however whatever the organization chooses and adopts, they should be aligned across all the teams and strictly adhered&nbsp;to.

### Important Patterns

**List Pagination** : All List methods over collections should support pagination using the standard fields, even if the response result set is&nbsp;small.

The API pagination can be supported in 2&nbsp;ways:

- **Limit Offset Pagination** using (offset,&nbsp;limit)
- **Cursor Pagination** using (limit, cursor\_next\_link)

The cursor next link makes the API really RESTful as the client can page through the collection simply by following these links (HATEOAS). No need to construct URLs manually on the client side. Moreover, the URL structure can simply be changed without breaking clients (evolvability).

**Delete Response** : Return Empty data response {} in hard delete while updated resource data response in soft delete. Return Null in failures and&nbsp;errors.

**Enumeration and default value** : 0 should be the start and default for enums like state singletons and their handling should be well documented.

**Singleton resources** : For example, the state machine of the resource (say, device type) as well as the state of the resource (say, device) should never support the Create and Delete method as the states (ON, OFF, RING etc) can be configured i.e. Updated but not Created or&nbsp;Deleted.

**Request tracing and duplication** : All requests should have a unique requestID, like a UUID, which the server will use to detect duplication and make sure the non-idempotent request like POST is only processed once. Also, requestID will help in distributed tracing and caching. The unique requestID should also be part of the response request&nbsp;section.

**Request Validation** : Methods with side-effects like Create, Update and Delete can have a standard boolean query parameter validate, which when set to true does not execute the request but only validates it. If valid, it returns the correct status code but current unchanged resource data response, else it returns the error status&nbsp;code.

    [https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s/state:ring?$validate=true](https://tenant.staging.saas.com/api/v1/device-types/house-alarm/devices/cbb96ec2-edae-47c4-87e9-86eb8b9c5ce4s/state:ring?$validate=true)

For example, the above request will validate whether alarm can be put to ring or&nbsp;not.

**HATEOAS (Hypertext as the Engine of Application State)**: Provide links for navigating through the API (especially, the resource url). For&nbsp;example,

    {
    "orderID":3,
    "productID":2,
    "quantity":4,
    "orderValue":16.60,
    "links":[
    {
    "rel":"customer",
    "href":"https://adventure-works.com/customers/3",
    "action":"GET",
    "format":["text/xml","application/json"]
    },
    {
    "rel":"customer",
    "href":"https://adventure-works.com/customers/3",
    "action":"PUT",
    "format":["application/x-www-form-urlencoded"]
    },
    {
    "rel":"self",
    "href":"https://adventure-works.com/orders/3",
    "action":"GET",
    "format":["text/xml","application/json"]
    },
    {
    "rel":"self",
    "href":"https://adventure-works.com/orders/3",
    "action":"PUT",
    "format":["application/x-www-form-urlencoded"]
    },
    {
    "rel":"self",
    "href":"https://adventure-works.com/orders/3",
    "action":"DELETE",
    "format":[]
    }]
    }

**Versioning** : Versioning enables the client or the consumer to keep track of the changes, be it compatible or even, incompatible breaking changes so that it can make specific version call for consumption, which it can&nbsp;process.

The versioning can be supported in 3&nbsp;ways:

- **URI versioning** :

    [https://tenant.staging.saas.com/api/v1/device-types/](https://tenant.staging.saas.com/api/v1/device-types/)

- **Query string versioning** :

    [https://tenant.staging.saas.com/api/device-types?$version=v1](https://tenant.staging.saas.com/api/device-types?$version=v1)

- **Header versioning** :

    GET[https://tenant.staging.saas.com/api/device-types](https://tenant.staging.saas.com/api/device-types)
    Custom-Header: api-version=v1

### Epilogue

So, you have divided the monolithic applications into microservices, all integrated by [loose coupling](https://en.wikipedia.org/wiki/Loose_coupling) into separate micro-applications. Now is the time to revisit your APIs, make them standardized and raise the bar of your APIs before making it external for customers. The APIs should be consistent, hierarchical and modular. The separation of methods, standard fields and patterns from the collection & resource hierarchy will allow you to build resource agnostic re-usable abstractions, which can be implemented by the resource interfaces and deployed as services.

You should even, break the frontend into micro-frontends and serve them separately to make it a complete micro-application. Refer to [my previous article — Demystifying micro-frontends](https://blog.jaykmr.com/demystifying-%CE%BC-frontends-c0431c74858c) for such micro-services-based backend to make a complete micro-application-based architecture.

> _Solve the problem once, use the solution everywhere!_

### Reference

1. [Google API Design&nbsp;Guide](https://cloud.google.com/apis/design/)
2. [Django Rest Framework API&nbsp;Guide](https://www.django-rest-framework.org/api-guide/)
3. [OData 4.0 Documentation](https://www.odata.org/documentation/)
4. [REST API Design Best Practices](https://phauer.com/2015/restful-api-design-best-practices/)
5. [Microsoft API Design&nbsp;Guide](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
 ![](https://medium.com/_/stat?event=post.clientViewed&referrerSource=full_rss&postId=7f0b94d12d05)
* * *

[Standardizing RESTful APIs](https://blog.jaykmr.com/standardizing-restful-apis-7f0b94d12d05) was originally published in [Technopreneurial Treatises](https://blog.jaykmr.com) on Medium, where people are continuing the conversation by highlighting and responding to this story.

