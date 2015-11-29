# Tila

Most Rails projects contain a lot of controllers that are quite repetitive,
because most controllers essentially what is needed to get a simple CRUD
interface. This project contains components that can be used to build the 
controller of this simple CRUD interface.

Because Tila favors composition over inheritance, is allows for a flexibility
that most other projects in this space don't have. If you only want to use a
part of Tila, that works perfectly fine.

## Components

* __Actionable__: Provides an `action` helper so we can simply find out which
  action is called and contains a list of actions that are operated on
  collection and which actions are actions that save the model instance. It also
  provides simple helpers to find out if the current action is in one of the
  lists.