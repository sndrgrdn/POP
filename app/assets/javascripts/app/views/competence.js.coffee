class App.Views.Competence extends Backbone.View

  className: 'competence'

  template: HandlebarsTemplates['app/templates/competence']

  events:
    'click .new_learninggoal': 'addSubmitForm'
    'click button.edit': 'editCompetence'
    'click button.destroy': 'destroyCompetence'
    'click .arrow--c': 'toggleSlider'
    'click .close--new': 'addSubmitButton'

  initialize: ->
    @childViews = []
    @listenTo @model, 'sync', @renderDetails
    @listenTo @model, 'destroy', @leave
    @listenTo App.Vent, 'learninggoal:create:'+@model.id, @addSubmitButton
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderDetails: ->
    v = new App.Views.LearningGoals( { collection: @model.learning_goals, model: @model })
    @childViews.push(v)
    @$el.find('#c_'+@model.id).append(v.render().el)

  addSubmitButton: ->
    @addView.leave()
    @$('.new_learninggoal_wrapper').html('<button class="add new_learninggoal">New LearningGoal</button>')

  addSubmitForm: (e) ->
    e.preventDefault()
    @addView = new App.Views.NewLearningGoal({ model: new App.Models.LearningGoal({ competence_id: @model.id })})
    @$('.new_learninggoal_wrapper').html(@addView.render().el)
    @$('input#name').focus()

  editCompetence: ->
    alert('modal window laden')

  destroyCompetence: ->
    return unless confirm('Weet je het zeker?')
    @model.destroy
      success: -> App.Vent.trigger 'competence:destroy'

  toggleSlider:(e) ->
    @$('.content--c').slideToggle(300)
    @$('.arrow--c').toggleClass('arrow__up')
    @$('.title--competence').toggleClass('title--active')