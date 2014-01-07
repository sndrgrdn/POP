class App.Models.Activity extends Backbone.Model
  urlRoot: '/activity'

class App.Collections.Activities extends Backbone.Collection
  model: App.Models.Activity
  url: '/activity'