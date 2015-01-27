Restaurant = require("../models/Restaurant")

module.exports = class Restaurants extends Backbone.Collection
  model: Restaurant
  url: 'restaurants/'

