class App.Models.LearningGoal extends Backbone.Model
  urlRoot: '/learning_goals'

  initialize: ->
    @listenTo @, 'change:activities', @convertActivites

  convertActivites: ->
    @activities = new App.Collections.Activities( @get('activities') )

class App.Collections.LearningGoals extends Backbone.Collection
  model: App.Models.LearningGoal
  url: '/learning_goals'