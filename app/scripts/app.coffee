AppView = require './views/AppView'

ScrollModule = require('./modules/scroll/ScrollModule.jsx')

class App extends Backbone.Marionette.Application
  initialize: =>
    console.log 'Initializing app...'

    @router = new Backbone.Marionette.AppRouter()

    @addInitializer((options) =>
      (new AppView()).render()
    )

    @addInitializer((options) =>
      @addRegions({
        scrollRegion: {
          selector: "#scroll"
          module: @submodules.Scroll
        }
      })
    )

    @addInitializer((options) =>
      Backbone.history.start()
    )

    @module('Scroll', ScrollModule)

    @start()

module.exports = new App()
