# Tila

**Tila is a set of modules that help you create simple CRUD controllers in Rails
with very little code.**

[![Gem Version](https://img.shields.io/gem/v/tila.svg)](https://rubygems.org/gems/tila)

Most Rails projects contain a lot of controllers that are quite repetitive,
because those controllers essentially implement what is needed to get a simple 
CRUD interface. This project contains components that can be used to build the 
controller of this simple CRUD interface.

Because Tila favors composition over inheritance, is allows for a flexibility
that most other projects in this space don't have. If you only want to use a
part of Tila, that works perfectly fine.

## Installation

Include Tila in your project by adding it to your `Gemfile`.

```ruby
gem 'tila'
```

Then run

```bash
bundle install
```

to make sure Tila is installed.

## Usage

After Tila is installed in your project, you can use it like this.

```ruby
class BunniesController < ApplicationController
  include Tila::Resourceful

  protected

  def permitted_resource_params
    resource_params.permit(:name, :fluffiness)
  end
end
```

This controllers will implement the basic CRUD actions (`index`, `show`, `edit`,
`update`, `new` and `create`) for the `Bunny` model. You only need to specify
the `permitted_resource_params` method to make sure only the expected parameters
are passed into the resource. And you'll need to write your own views. Tila will
automatically infer from the name of the controller class that this is a 
controller for the `Bunny` model and will make sure you can use `@bunnies` in 
the `index` view and `@bunny` in the other views.

## Components

Tila favors composition of inheritance, so it contains a lot of small modules
that can be used indepently. The example above only shows the result of
including the `Tila::Resourceful` module, but you can choose to only include
small parts of Tila. Below you can find a list of the components of Tila, with
a short explanation of what they do and which other components they depend on.

* __Actionable__: Provides an `action` helper so we can simply find out which
  action is called.
* __ActionTypes__: Provides lists of actions and helpers that allows us to
  figure out what type of action we are dealing with. Requires _Actionable_.
* __Modelable__: Provides an `model` helper so we can access the model that the
  controller is for, and a few helpers to access model name.
* __Messages__: Provide a simple helper for generating message strings from
  I18n. Requires _Modelable_.
* __Objects__: Provides a simple accessor for `@object` and `@objects`. The
  _ResourceLoaders_ component registers the loaded resources here.
* __Params__: Provides a way to update the attributes of the object and simple
  starting point for filtering out the permitted resource params. Requires
  _Modelable_, _Objects_.
* __SaveDestroy__: Provides the `save_object` and `destroy_object` methods.
  Requires _Objects_.
* __FormHandler__: Provides methods to handle the submit of forms and the
  destroy. Requires _Messages_, _Objects_, _SaveDestroy_. You need to define a
  `location_after_save` and a `location_after_destroy` method, if you want to
  use this module in isolation. The _Resourceful_ component defines these
  methods for you.
* __ResourceLoaders__: Provides methods for loading the resources. Requires
  _Modelable_ and _Objects_.
* __ResourcefulUrls__: Generates the URLs to the controller. Requires 
  _Modelable_.
* __Resourceful__: Implements the actual controller actions, registers the 
  _before_action_ to load the resources. This is the part that you want to
  include when you want to enjoy the full glory of Tila. Requires _Actionable_,
  _Params_, _FormHandler_, _ResourceLoaders_ and _ResourcefulUrls_.


