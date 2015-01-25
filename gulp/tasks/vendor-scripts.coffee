gulp = require('gulp')
plumber = require('gulp-plumber')
concat = require('gulp-concat')
uglify = require('gulp-uglify')

config = require('./config')


gulp.task 'vendor-scripts', ->
  stream = gulp.src([
    config.paths.vendor + 'scripts/jquery.js',
    config.paths.vendor + 'scripts/bootstrap.js',
    config.paths.vendor + 'scripts/underscore.js',
    config.paths.vendor + 'scripts/backbone.js',
    config.paths.vendor + 'scripts/backbone.syphon.js',
    config.paths.vendor + 'scripts/backbone.marionette.js',
    config.paths.vendor + 'scripts/backbone-faux-server.js'
    config.paths.vendor + 'scripts/react-with-addons.js',
    config.paths.vendor + 'scripts/JSXTransformer.js',
    config.paths.vendor + 'scripts/react-infinite.js'
  ])
  .pipe(plumber())
  .pipe(concat("vendor.js"))

  stream.pipe(uglify()) if config.env() == 'production'

  stream.pipe(gulp.dest(config.paths.dest + 'js/'))

  return
