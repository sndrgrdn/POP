class App.Views.Studieplanner extends Backbone.View

  className: 'container'

  template: HandlebarsTemplates['app/templates/studieplanner']

  events:
    'click #new_competence': 'renderNewCompetence'

  initialize: ->
    @childViews = []
    @listenTo App.Vent, 'competence:create', @refreshPage

  render: ->
    @$el.html(@template())
    @renderCompetencies()
    @

  renderCompetencies: ->
    v = new App.Views.Competences({ collection: new App.Collections.Competences })
    @childViews.push(v)
    @$el.append(v.render().el)

  renderNewCompetence: ->
    v = new App.Views.NewCompetence({ model: new App.Models.Competence})
    @childViews.push(v)
    @$el.append(v.render().el)
    Backbone.history.navigate('/competences/new')

  refreshPage: ->
    window.location.href = '/'
