window.App = require('./app')
bfs = require('./faux-server')

$ ->
  console.log("fauxServer version: " + fauxServer.getVersion());

  bfs.run()

  App.initialize()
