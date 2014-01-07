class App.Views.NewLearningGoal extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_learninggoal']

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
        App.Vent.trigger 'learninggoal:create:'+model.get('competence_id'), model