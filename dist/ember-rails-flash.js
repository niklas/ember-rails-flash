// Generated by CoffeeScript 1.4.0
(function() {
  var _ref;

  if ((_ref = Ember.Rails) == null) {
    Ember.Rails = Ember.Namespace.create();
  }

  Ember.Rails.FlashMessage = Ember.Object.extend({
    severity: null,
    message: ''
  });

  Ember.Rails.FlashItemView = Ember.View.extend({
    basicClassName: 'flash',
    template: Ember.Handlebars.compile("{{#with view.content}}\n  <div {{bindAttr class=\"view.basicClassName severity\"}}>{{message}}</div>\n{{/with}}")
  });

  Ember.Rails.FlashMessagesController = Ember.ArrayController.extend({
    init: function() {
      var _this = this;
      this._super();
      return jQuery(document).ajaxComplete(function(event, request, settings) {
        return _this.extractFlashFromHeaders(request);
      });
    },
    extractFlashFromHeaders: function(request) {
      var header, headers, m, _i, _len, _ref1, _results;
      headers = request.getAllResponseHeaders();
      _ref1 = headers.split(/\n/);
      _results = [];
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        header = _ref1[_i];
        if (m = header.match(/^X-Flash-([^:]+)/)) {
          _results.push(this.createMessage({
            severity: m[1].underscore(),
            message: request.getResponseHeader("X-Flash-" + m[1])
          }));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    },
    createMessage: function(args) {
      var message;
      message = Ember.Rails.FlashMessage.create(args);
      return this.get('content').pushObject(message);
    }
  });

  Ember.Rails.flashMessages = Ember.Rails.FlashMessagesController.create({
    content: Ember.A()
  });

  Ember.Rails.FlashListView = Ember.CollectionView.extend({
    tagName: 'div',
    itemViewClass: Ember.Rails.FlashItemView,
    contentBinding: 'Ember.Rails.flashMessages'
  });

}).call(this);
