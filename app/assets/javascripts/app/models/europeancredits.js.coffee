class App.Models.EuropeanCredit extends Backbone.Model
  urlRoot: '/european_credits'

class App.Collections.EuropeanCredits extends Backbone.Collection
  model: App.Models.EuropeanCredit
  url: '/european_credits'