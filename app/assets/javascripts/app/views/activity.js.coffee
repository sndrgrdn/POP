class App.Views.Activity extends Backbone.View

  tagName: 'li'

  template: HandlebarsTemplates['app/templates/activity']

  events:
    'click button.edit': 'editActivity'
    'click button.destroy': 'destroyActivity'
    'click .close': 'renderUpdate'
    'click .check--a': 'toggleComplete'

  initialize: ->
    @childViews = []
    @listenTo @model, 'sync', @render
    @listenTo @model, 'destroy', @leave
    @listenTo App.Vent, 'activity:edit:'+@model.id, @renderUpdate
    @listenTo App.Vent, 'activity:complete:'+@model.id, @renderUpdate
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderUpdate: ->
    @render()

  destroyActivity: ->
    return unless confirm('Weet je het zeker?')
    @model.destroy
      success: -> App.Vent.trigger 'activity:destroy'

  editActivity: ->
    if (@editView)
      @editView.leave()
    @editView = new App.Views.EditActivity({ model: @model })
    @$('.title').first().html(@editView.render().el)
    @$('input#name').focus()

  toggleComplete: ->
    if @model.get 'is_completed'
      @model.set is_completed: false
    else
      @model.set is_completed: true
    @model.save {},
      success: (model) ->
        App.Vent.trigger 'activity:complete:'+model.id, model