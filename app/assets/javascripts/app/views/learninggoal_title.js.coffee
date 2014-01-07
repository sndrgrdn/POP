class App.Views.LearningGoalTitle extends Backbone.View

  template: HandlebarsTemplates['app/templates/learninggoal_title']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @