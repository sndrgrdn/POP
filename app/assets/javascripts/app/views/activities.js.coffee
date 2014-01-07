class App.Views.Activities extends Backbone.View

  tagName: 'ul'
  className: 'activities'

  initialize: ->
    @childViews = []
    @listenTo App.Vent, 'activity:create:'+@model.id, @addToCollection
    @listenTo @collection, 'add', @renderActivities

  render: ->
    @collection.forEach @renderActivities, @
    @

  renderActivities: (model) ->
    v = new App.Views.Activity({ model: model })
    @childViews.push(v)
    @$el.append(v.render().el)

  addToCollection: (model) ->
    @collection.add(model)