class App.Views.EditActivity extends Backbone.View

  template: HandlebarsTemplates['app/templates/edit_activity']

  events:
    'submit form': 'saveActivity'

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveActivity: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.save {},
      success: (model) ->
        App.Vent.trigger 'activity:edit:'+model.id, model