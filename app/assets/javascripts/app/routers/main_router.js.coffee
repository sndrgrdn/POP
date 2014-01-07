class App.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'competences/new': 'newCompetence'

  initialize: ->
    @StudieplannerView = new App.Views.Studieplanner()

  index: ->
    @layout()

  layout: ->
    $(document.body).prepend(@StudieplannerView.render().el)

  newCompetence: ->
    @layout()
    v = new App.Views.NewCompetence({ model: new App.Models.Competence})
    $('.container').append(v.render().el)