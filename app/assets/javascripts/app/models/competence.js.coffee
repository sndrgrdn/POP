class App.Models.Competence extends Backbone.Model
  urlRoot: '/competences'

  initialize: ->
    @listenTo @, 'change:learning_goals', @convertLearningGoals
    @listenTo @, 'change:european_credits', @convertEuropeanCredits

  convertLearningGoals: ->
    @learning_goals = new App.Collections.LearningGoals( @get('learning_goals') )

  convertEuropeanCredits: ->
    @european_credits = new App.Collections.EuropeanCredits( @get('european_credits') )


class App.Collections.Competences extends Backbone.Collection
  model: App.Models.Competence
  url: '/competences'
