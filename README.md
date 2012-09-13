# EmberRailsFlash

Make Rails' flash messages available to Ember.js applications. Inspired by a [Blog post by Stefan Siebel](http://blog.project-sierra.de/archives/1808).

## Installation

### Gem

Add the ember-rails-flash gem to your Gemfile (not released as .gem file yet).

```ruby
gem 'ember-rails-flash', git: 'git://github.com/niklas/ember-rails-flash.git'
```

### Controllers

Include EmberRailsFlash::FlashInHeader in (all) the controller(s) dealing with Ember.js. ApplicationController is totally fine.

```ruby
class ApplicationController < ActionController::Base
  # ...
  include EmberRailsFlash::FlashInHeader
end
```

### Asset Pipeline

Add the javascripts to your asset pipeline (for example application.js), preferrably after ember itself.
```css
//= require handlebars
//= require ember
//= require ember-rails-flash
```

### Ember.js

Now, you can use the provided view directly in your templates or extend them.

```coffeescript
MyApp.Messages = Ember.Rails.FlashListView.extend
  fnord: (->
    @get('content').fnordify()
  ).property('content')
  template: null # template is defined inline
  templateName: 'app/shared/flash'
```

```handlebars
<h1>My new App</h1>
{{view MyApp.Messages}}

### Enable flash messages for JSON responses

If you use the `responders` gem (which you do if you use the `inherited_resources` gem), you may want to enable the FlashResponder. If you don't, the expected i_h flash messages will no be set on respond formats other than "html". So for example in `config/initializers/flash.rb`:

```ruby
EmberRailsFlash.enable_flash_responder 'json'
```

## FAQ

### Where are your tests?

Tests? What the frak are tests? - Will come .. soon.. ish

### Coffeescript? Why?

I love [CoffeeScript](http://coffeescript.org) as it keeps the bad parts out of my JS.

### This is not the way to write Ember.js related plugins

I really don't know a better way. If you have one, please send me a pull request :)

### You are using Ember.js wrong!

Still learning, please educate me - SRSLY.


## Contributing

Feel free to open an issue ticket if you find something that could be improved.

This project rocks and uses GPL-3 as license.

