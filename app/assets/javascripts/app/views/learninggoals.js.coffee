class App.Views.LearningGoals extends Backbone.View

  tagName: 'ul'
  className: 'goals'

  initialize: ->
    @childViews = []
    @listenTo App.Vent, 'learninggoal:create:'+@model.id, @addToCollection
    @listenTo @collection, 'add', @renderLearningGoal

  render: ->
    @collection.forEach @renderLearningGoal, @
    @

  renderLearningGoal: (model) ->
    v = new App.Views.LearningGoal({ model: model })
    @childViews.push(v)
    @$el.append(v.render().el)

  addToCollection: (model) ->
    @collection.add(model)