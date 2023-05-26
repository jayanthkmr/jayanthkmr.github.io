---
layout: post
author: Jayanth Kumar
title: Architecting Event driven Systems the right way
date: 2022-08-15 02:33:50 UTC
background: //cdn-images-1.medium.com/max/960/1*zl9M75KgAEFfRK3ir4kxFg.png
---

### Architecting Event-driven Systems the right&nbsp;way

### Prologue

![](https://cdn-images-1.medium.com/max/1024/0*wrZyN8djngeiXY4X)

So, you have built your enterprise application as [loosely coupled](https://en.wikipedia.org/wiki/Loose_coupling) micro-services, even made them [serverless](https://en.wikipedia.org/wiki/Serverless_computing) after reading [my old article — Serverless Microservices](https://jaykmr.medium.com/serverless-microservices-ea465c439183) but after attending a few cool tech conferences and coming across the term — event-driven or event-sourcing architectures, you start wondering whether you have made the right architectural decisions. You revisit your domain problem, relook at the business requirements, and then, comes the&nbsp;problem:

### The Problem

So, you have built your application architecture on top of [Entity Relationship Model](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) or [Object Model](https://en.wikipedia.org/wiki/Object_model) or [Attribute Value Model](https://en.wikipedia.org/wiki/Entity%E2%80%93attribute%E2%80%93value_model), using those models to capture the application state for your business&nbsp;problem.

Then, the audit department comes in, asking an explanation for how a particular object evolved to a particular value or may request you to revert or time-travel back to a specific state of the object in the business context. In simple words, they don’t care where the application state is now as that may have become corrupt but want to drill down to the root cause of that state corruption by figuring out how it got there by which events, as well as revert back to the last valid state of the business&nbsp;object.

![](https://cdn-images-1.medium.com/max/403/0*au2aM_B5gLE8jYW1)

Also, as you add more and more objects and services and glue them together, you start worrying about the scalability of any audit logs, you would create to capture the evolution of the objects in the application state.

### The Concepts

You look at the problem from the first principles and start by understanding that the business logic can be modelled as [event-driven state machines](https://en.wikipedia.org/wiki/Event-driven_finite-state_machine):

**State Machine**  — A state machine is a mathematical abstraction used to design algorithms based on behaviour model. A state machine reads a set of inputs and changes to a different state based on those&nbsp;inputs.

**State ** — A state is a description of the status of a system waiting to execute a transition.

**Transition**  — A transition is a change from one state to another. A transition is a set of actions to execute when a condition is fulfilled or an event received.

**Event ** — The entity that drives the state&nbsp;changes.

**Event-driven State Machine**  — A state machine is event-driven, if the transition from one state to another is triggered by an event or a message (not based on consuming/parsing characters or based on conditions).

Here is a sample example of an event-driven state machine for a button application, having two states of On and Off and one action of buttonPressed:

![](https://cdn-images-1.medium.com/max/1000/0*HdLYuHM5XfmXgA3r)

**Event Driven Systems ** — Event Driven Architecture is about components communicating via publishing events rather than making (e.g.) RPC/CRUD calls against each other or manipulating shared state. It’s a communication strategy (albeit one which often relies on messages being persisted for fairly long periods until they are consumed).

### Implementation Paradigms for Event Driven&nbsp;System

**Paradigm 1 — State oriented** [**Object Model**](https://en.wikipedia.org/wiki/Object_model) **or** [**Attribute Value Model**](https://en.wikipedia.org/wiki/Entity%E2%80%93attribute%E2%80%93value_model)&nbsp;: The implementation of event driven system can be done by capturing only the current state of the system. This naturally, is based on model state oriented persistence, that only keeps the latest version of the entity state. State is stored as dictionary or record of attribute values and the attributes are first-class citizens, which are only modified by allowed encapsulated methods as event&nbsp;actions.

    public class button {
    
    boolean state;
    
    
    public void buttonPressed(){
    
    state = !state;
    
    }
    
    public void setState(boolean state){
    
    this.state = state;
    
    }
    
    public boolean getState(){
    
    return state;
    
    }
    
    }

For example, the state of the button application, which was initially only stored as an attribute value of On or Off [encapsulated](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)) along with the modifier action of buttonPressed as the method in the [Entity Relationship Model](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) or [Object Model](https://en.wikipedia.org/wiki/Object_model) or [Attribute Value Model](https://en.wikipedia.org/wiki/Entity%E2%80%93attribute%E2%80%93value_model). The system is still event-driven as it operates on the events but the events are not the first-class citizens of this system but rather, the current attribute value or state of the entity button, whether it is on or off is the first class citizen. The event or encapsulated method of buttonPressed is not stored but just, applied eagerly to update the current state and thus, can’t be replayed or time-travelled.

Consider another example of a shopping cart service, where the cart is represented as a record in a carts table and a cart-items table represents rows that say “2 bananas in cart 101 with price $1 a piece” in relational model. To add items to the cart, we insert (or update if it’s just a quantity change) rows to the cart-items table. When the cart is checked out, we publish a representation of the cart in json or other serialized formart and its contents so the shipping service has what’s in the cart and we set carts.checked\_out to&nbsp;TRUE.

That’s a perfectly sane Event Driven Architecture. The cart service communicates that there’s a checked out cart to the shipping service. However, it’s not event-sourced, i.e. we can’t reconstruct the database tables from the events as we are not tracking the&nbsp;events.

**Paradigm 2 — ** [**Event Sourcing**](https://martinfowler.com/eaaDev/EventSourcing.html)&nbsp;: The implementation of event driven system can also be done by capturing only the events manifested into the system. This naturally, is based on event-sourced (using event journal) persistence, where each state/attribute mutation is stored as a separate record called as an event. Events are first-class citizens in the persistence and states and attributes are side-effects of events. We store the events, and lazily apply it to derive the state or attributes in the query resolver. Events can also be replayed or time-travelled.

    enum event {

    BUTTON_PRESSED
    
    }

    public class event_sourced_button {

    List < event > buttonEvents = new ArrayList < event > ();

    public void buttonPressed() {
    buttonEvents.add(event.BUTTON_PRESSED);
    }

    private boolean applyEvent(event e, boolean state) {

    if (e == event.BUTTON_PRESSED)
    state = !state;

    return state;

    }

    public boolean getState(boolean initialState) {
    boolean state = initialState;

    for (event e: buttonEvents)
    state = applyEvent(e, state);

    return state;

    }

    }

For example, the event sourced implementation of the button application will not store the state of the button but rather, will store the events of buttonPressed on the button and will apply those events one by one to derive the current state. The system is event-driven as well as [event-sourced](https://martinfowler.com/eaaDev/EventSourcing.html) as it operates on the events by making the events as the first-class citizens of this system, only storing them and then, deriving the current attribute value or state of the entity button, whether it is on or off from the event list. The events are just, applied lazily to evaluate the current state, given the initial state and thus, can be replayed or time-travelled upto certain time or&nbsp;events.

Similarly, the previous example of shopping cart service could also be made event sourced. It stores events in an event store (which could be a datastore designed for the needs of event sourcing or could be relational database or non-relational database being used in a particular way (e.g. an events table)). The following sequence of events for cart 101 might be written to the event&nbsp;store:

1. AddItem { “banana”, $1.00&nbsp;}
2. AddItem { “apple”, $1.50&nbsp;}
3. AddItem { “banana”, $1.00&nbsp;}
4. RemoveItem { “apple”&nbsp;}
5. DiscountApplied { Requirement { 2, “banana” }, -$0.10&nbsp;}
6. AddItem { “mango”, $2.00&nbsp;}
7. CheckedOut { Items { Item { “banana”, 2, $1.00 }, Item { “mango”, 1, $2.00 } }, Discount {“banana”, 2, -$0.10}&nbsp;}

That last event (along with the fact that it’s for cart 101, which is metadata associated with the event) can be used to derive an event for publishing. One key thing to note is that there’s nothing else being written to the database but these&nbsp;events.

### Benefits of using Event Sourcing based Event Driven&nbsp;Systems

Since, event sourcing mandates keeping a persistence journal log of the events, which forms the single source of truth to derive the application state, this in-turn provides a number of facilities that can be built on top of the event&nbsp;log:

- **Complete Rebuild** : The application state can be discarded completely and rebuilt by re-running the events from the event log on that empty application state.
- **Temporal Query** : The application state can be determined at any point in time by starting with blank application state and then, rerunning the events up to a particular time or&nbsp;event.
- **Event Replay** : If any past event was incorrect, the consequences can be computed by reversing it and the later events and finally, replaying the new correct event and the later events. This can also, be achieved by blank application state and replaying the events after fixing them and their&nbsp;order.
- **System Debug/Audit** &nbsp;: The append-only storage of events in the event sourced journal provides an audit trail that can be used to monitor actions taken against a data store, regenerate the current state as materialized views or projections by replaying the events at any time, and assist in testing and debugging the&nbsp;system.

### Using Event Stores for Event Sourcing based Event Driven&nbsp;Systems

The Event Sourcing pattern captures the application state transition or the data mutations by storing the sequence of events (each representing that data or state mutation), each of which is recorded in an immutable append-only store. That immutable append-only store acts as a single source of truth about the operations on the application state and data as well as, the event store typically publishes these events so that consumers can be notified and can handle them, if needed. Consumers could, for example, initiate tasks that apply the operations in the events to other systems, or perform any other associated action that’s required to complete the operation, thus decoupling the application from the subscribed systems.

An Event Sourced persistence will model the entities as Event Streams and keep an immutable journal of these event streams. When the entity state or attribute mutates, a new event is produced and saved. When the entity state needs to be restored, all the events for that entity are read and each event is applied to change the state, reaching the correct final state of the entity. Note that, State here, is the pure function application of the event stream on the&nbsp;entity.

Here is how a sample EntityStoreAdaptor on top of Event Store persistence for Event Sourcing will look&nbsp;like:

    public class EntityStoreAdapter {

    EventDatabase db;
    Serializer serializer;

    //Command Applier Eager
    public void Save < T > (T entity) where T: Entity {

    var changes = entity.changes;

    if (changes.IsEmpty()) return; // nothing to do

    var dbEvents = new List < DbEvent > ();

    foreach(var event in changes) {
    var serializedEvent = serializer.Serialize(event);
    dbEvents.Add(
    data: new DbEvent(serializedEvent),
    type: entity.GetTypeName();
    );
    }

    var streamName = EntityStreamName.For(entity);
    db.AppendEvents(streamName, dbEvents);

    }

    //Query Resolver Lazy
    public T Load < T > (string id) where T: Entity {

    var streamName = EntityStreamName.For(entity);
    var dbEvents = db.ReadEvents(streamName);

    if (dbEvents.IsEmpty()) return default (T); // no events

    var entity = new T();
    foreach(var event in dbEvents) {
    entity.When(event);
    }

    return entity;
    }
    }

### Materializing Application State for Event Sourcing based Event Driven&nbsp;Systems

In end-user facing applications, the current state of the application needs to be derived on-demand and that is derived from the [materialization](https://en.wikipedia.org/wiki/Materialized_view) of the events as actions on top of the entity states. This can also, be done using a scheduled job so that the state of the entity can be stored for querying and presentation.

For example, a system can maintain a [materialized view](https://en.wikipedia.org/wiki/Materialized_view) of all customer orders that’s used to populate parts of the UI, say aggregated view. As the application adds new orders, adds or removes items on the order, and adds shipping information, the events that describe these changes can be handled and used to update the [materialized view](https://en.wikipedia.org/wiki/Materialized_view).

Event sourcing is commonly combined with the [CQRS pattern](https://martinfowler.com/bliki/CQRS.html), an architectural style that separates reads from writes. In [CQRS](https://martinfowler.com/bliki/CQRS.html) architecture, data from write database streams to a read database and gets materialized on which queries run. Since, Read/Write layers are separate, the system remains eventually consistent but scales to heavy reads and&nbsp;writes.

### Caveats to take care in Event Sourcing based Event Driven&nbsp;Systems

1. **Eventual Consistency**  — The reads will not be based on the most recent writes of the events as there will be delay in between creating new materialized views or the projections of the data by event replaying. During the delay between publishing of the events, creating the materialized view and notifying the consumers, new events will have been written to the event&nbsp;journal.
2. **Event Log Immutability**  — The event log acts as a single source of truth and needs to be immutable and thus, event data should never be updated. In order to update an entity to undo a change is to add a corresponding event to fix it. Even the event schema change needs to done on all the events in the event journal&nbsp;store.
3. **Event Ordering and Linearity**  — As multiple applications or publishers will be creating and publishing events to the event store, the event ordering and linearity becomes important to maintain the data consistency. Adding a timestamp to every event or annotating each event resulting from a request with an incremental identifier resolves the issue of ordering conflict.
4. **Consumer Idempotency**  — Event publication might be at least once (as keeping it exactly once will be difficult), and so consumers of the events must be idempotent. They must not reapply the update described in an event if the event is handled more than once so avoid unnecessary side-effects on the entity state or data attribute computation.
5. **Snapshotting and Materialising**  — The events needs to be snapshotted and materialised on regular intervals, specially if the size of the event stream is large to handle on-demand queries on the model state and its attribute data.

### Difference between Event Sourcing and Change Data&nbsp;Capture

[Change data events](https://en.wikipedia.org/wiki/Change_data_capture) use the underlying database transaction log as the source of truth. The event is based on the database that the transaction log belongs to, rather than the original application and the event is available for as long as the events are persisted (not immutable) based on a mutable database, which means tighter coupling to the database data model. The [CDC](https://en.wikipedia.org/wiki/Change_data_capture) captures the effect of the event in terms of create, update or delete, for example, the button was update to off&nbsp;state.

### The Realization

Event Sourcing can be realized end-to-end as let’s say on AWS&nbsp;:

- [Kinesis Data Streams](https://aws.amazon.com/kinesis/data-streams/) serverless data streaming service
- [Kinesis Firehose](https://aws.amazon.com/kinesis/data-firehose/) ETL service to deliver streaming data to data warehouse
- [S3](https://aws.amazon.com/s3/) Highly available and scalable object&nbsp;store
- [Redshift](https://aws.amazon.com/redshift/) Cloud data warehouse
- [API Gateway](https://aws.amazon.com/api-gateway/) Cloud API management
- [Lambda](https://aws.amazon.com/lambda/) Cloud native functions for compute&nbsp;services

![](https://cdn-images-1.medium.com/max/811/0*wXTEfLk6z-kiYoNy)

### Epilogue

So, you have now understood the event driven systems architecture and dived deep into event sourcing to implement such system. However, the use-cases of event sourcing systems needs to taken into consideration before going ahead with the implementation of such complex system for event driven architecture. The event sourcing should be used, when intent, purpose, or reason in the data needs to be captured as recorded events that occur, and be able to replay them to restore the state of a system, roll back changes, or keep a history and audit log, i.e. events emerge as natural first-class functional feature of the system and the system can accept eventual consistency for the data entity models as its non-functional side-effect.

> _Solve the problem once, use the solution everywhere!_

 ![](https://medium.com/_/stat?event=post.clientViewed&referrerSource=full_rss&postId=1dd7f4e63f96)
* * *

[Architecting Event driven Systems the right way](https://blog.jaykmr.com/architecting-event-driven-systems-the-right-way-1dd7f4e63f96) was originally published in [Technopreneurial Treatises](https://blog.jaykmr.com) on Medium, where people are continuing the conversation by highlighting and responding to this story.

