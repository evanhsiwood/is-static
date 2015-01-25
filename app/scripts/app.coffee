AppView = require './views/AppView'

ColorbarModule = require('./modules/colorbar/ColorbarModule')

class App extends Backbone.Marionette.Application
  initialize: =>
    console.log 'Initializing app...'

    @router = new Backbone.Marionette.AppRouter()

    @addInitializer((options) =>
      (new AppView()).render()
    )

    @addInitializer((options) =>
      @addRegions({
#        colorbarRegion: {
#          selector: "#colorbar"
#          module: @submodules.Colorbar
#        }
      })
    )

    @addInitializer((options) =>
      Backbone.history.start()
    )

#    @module('Colorbar', ColorbarModule)

    @start()

module.exports = new App()
