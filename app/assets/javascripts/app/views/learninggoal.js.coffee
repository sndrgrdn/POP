class App.Views.LearningGoal extends Backbone.View

  tagName: 'li'

  template: HandlebarsTemplates['app/templates/learninggoal']

  events:
    'click .new_activity': 'addSubmitForm'
    'click button.edit': 'editLearningGoal'
    'click button.destroy': 'destroyLearningGoal'
    'click .arrow--l': 'toggleSlider'
    'click .close': 'renderTitle'
    'click .close--new': 'addSubmitButton'
    'click .check--l': 'toggleComplete'

  initialize: ->
    @childViews = []
    @listenTo @model, 'change:activities', @renderDetails
    @listenTo @model, 'destroy', @leave
    @listenTo App.Vent, 'activity:create:'+@model.id, @addSubmitButton
    @listenTo App.Vent, 'learninggoal:edit:'+@model.id, @renderTitle
    @listenTo App.Vent, 'learninggoal:complete:'+@model.id, @renderTitle
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @renderTitle()
    @addSubmitButton()
    @

  renderDetails: ->
    if (@model.activities)
      v = new App.Views.Activities( { collection: @model.activities, model: @model })
      @childViews.push(v)
      @$('#l_'+@model.id).append(v.render().el)

  renderUpdate: ->
    @childViews.forEach (v) ->
      v.leave()
    @render()
    @renderDetails()

  renderTitle: ->
    if @titleView
      @titleView.leave()
    @titleView = new App.Views.LearningGoalTitle( { model: @model })
    @childViews.push(@titleView)
    @$('.title').first().html(@titleView.render().el)

  addSubmitButton: ->
    if @addView
      @addView.leave()
    @$('.new_activity_wrapper').html('<button class="add new_activity">New Activity</button>')

  addSubmitForm: (e) ->
    e.preventDefault()
    @addView = new App.Views.NewActivity({ model: new App.Models.Activity({ learning_goal_id: @model.id })})
    @$('.new_activity_wrapper').html(@addView.render().el)
    @$('input#name').focus()

  destroyLearningGoal: ->
    return unless confirm('Weet je het zeker?')
    @model.destroy
      success: -> App.Vent.trigger 'learninggoal:destroy'

  editLearningGoal: ->
    if (@editView)
      @editView.leave()
    @editView = new App.Views.EditLearningGoal({ model: @model })
    @$('.title').first().html(@editView.render().el)
    @$('input#name').focus()

  toggleSlider:(e) ->
    @$('.content--l').slideToggle(300)
    @$('.arrow--l').toggleClass('arrow__up')

  toggleComplete: ->
    if @model.get 'is_completed'
      @model.set is_completed: false
    else
      @model.set is_completed: true
    @model.save {},
      success: (model) ->
        App.Vent.trigger 'learninggoal:complete:'+model.id, model