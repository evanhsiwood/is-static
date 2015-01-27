module.exports = {
  run: ->
    fauxServer.get("restaurants/", ->
      console.log "mock ⇾ [restaurants/ GET]"
      require('./mocks/restaurants.json')
    )
}