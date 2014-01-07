class App.Views.NewActivity extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_activity']

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
        App.Vent.trigger 'activity:create:'+model.get('learning_goal_id'), model