class App.Views.NewCompetence extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_competence']

  events:
    'submit form': 'saveCompetence'

  render: ->
    @$el.html(@template())
    @

  saveCompetence: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.save {},
      success: (model) -> App.Vent.trigger 'competence:create', model