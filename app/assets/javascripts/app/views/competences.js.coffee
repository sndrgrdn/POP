class App.Views.Competences extends Backbone.View

  className: 'studieplanner'

  initialize: ->
    @childViews = []
    @listenTo @collection, 'reset', @render
    @collection.fetch({ reset: true })

  render: ->
    @collection.forEach @renderCompetence, @
    @

  renderCompetence: (model) ->
    v = new App.Views.Competence({ model: model})
    @childViews.push(v)
    @$el.append(v.render().el)