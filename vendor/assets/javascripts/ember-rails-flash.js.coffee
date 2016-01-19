Ember.Rails ?= Ember.Namespace.create()

Ember.Rails.FlashMessage = Ember.Object.extend
  severity: null
  message: ''

Ember.Rails.FlashMessagesController = Ember.Controller.extend
  init: ->
    @_super()
    jQuery(document).ajaxComplete (event, request, settings) => @extractFlashFromHeaders request

  extractFlashFromHeaders: (request)->
    headers = request.getAllResponseHeaders()
    for header in headers.split(/\n/)
      if m = header.match /^X-Flash-([^:]+)/
        @createMessage severity: m[1].underscore(), message: request.getResponseHeader("X-Flash-#{m[1]}")

  createMessage: (args) ->
    message = Ember.Rails.FlashMessage.create args
    @get('content').pushObject(message)

Ember.Rails.flashMessages = Ember.Rails.FlashMessagesController.create
  content: Ember.A()
