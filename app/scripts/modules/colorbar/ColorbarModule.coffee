getData = getData = ->
  [
    {
      color: "red"
      value: "#f00"
    }
    {
      color: "green"
      value: "#0f0"
    }
    {
      color: "blue"
      value: "#00f"
    }
    {
      color: "cyan"
      value: "#0ff"
    }
    {
      color: "magenta"
      value: "#f0f"
    }
    {
      color: "yellow"
      value: "#ff0"
    }
    {
      color: "black"
      value: "#000"
    }
  ]

module.exports = class ColorbarModule extends Marionette.Module
  initialize: ->
    @MainV = require("./components/MainV.react.jsx")

    console.log 'Initializing ColorbarModule'
    @startWithParent = true

  onStart: ->
    rows = getData()
    mainV = new @MainV(rows: rows)
    React.render(mainV, document.getElementById('colorbar'))

    console.log 'Starting ColorbarModule'

  onStop: ->
    console.log 'Stopping ColorbarModule'

