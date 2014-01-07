class App.Views.EditLearningGoal extends Backbone.View

  template: HandlebarsTemplates['app/templates/edit_learninggoal']

  events:
    'submit form': 'saveLearningGoal'

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveLearningGoal: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.save {},
      success: (model) ->
        App.Vent.trigger 'learninggoal:edit:'+model.id, model