# EmberRailsFlash

Make Rails' flash messages available to Ember.js applications. Inspired by a [Blog post by Stefan Siebel](http://blog.project-sierra.de/archives/1808).

## Installation

Add the ember-rails-flash gem to your Gemfile.

```ruby
gem 'ember-rails-flash'
```

Include EmberRailsFlash::FlashInHeader in (all) the controller(s) dealing with Ember.js. ApplicationController is totally fine.

```ruby
class ApplicationController < ActionController::Base
  # ...
  include EmberRailsFlash::FlashInHeader
end
```

Add the javascripts to your asset pipeline (for example application.js), preferrably after ember itself.
```css
//= require handlebars
//= require ember
//= require ember-rails-flash
```

Now, you can use the provided view directly in your templates or extend them.

```coffeescript
MyApp.Messages = Ember.Rails.FlashListView.extend
  fnord: (->
    @get('content').fnordify()
  ).property('content')
```

```handlebars
<h1>My new App</h1>
{{MyApp.Messages}}

## FAQ

### Coffeescript? Why?

I love [CoffeeScript](http://coffeescript.org) as it keeps the bad parts out of my JS.

### This is not the way to write Ember.js related plugins

I really don't know a better way. If you have one, please send me a pull request :)


## Contributing

Feel free to open an issue ticket if you find something that could be improved.

This project rocks and uses GPL-3 as license.

