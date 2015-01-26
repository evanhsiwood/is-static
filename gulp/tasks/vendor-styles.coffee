gulp = require('gulp')
plumber = require('gulp-plumber')
concat = require('gulp-concat')
minify = require('gulp-minify-css')

config = require('./config')


gulp.task 'vendor-styles', ->
  # css
  stream = gulp.src([
    config.paths.vendor + 'styles/ionic.css'
  ])
  .pipe(plumber())
  .pipe(concat("vendor.css"))

  stream.pipe(minify()) if config.env() == 'production'

  stream.pipe(gulp.dest(config.paths.dest + '/css'))

  #  map
#  stream = gulp.src([
#    config.paths.vendor + 'styles/bootstrap.css.map',
#    config.paths.vendor + 'styles/bootstrap-theme.css.map'
#  ])
#  stream.pipe(gulp.dest(config.paths.dest + 'css/'))

  # font
  stream = gulp.src([
    config.paths.vendor + 'fonts/**'
  ])
  stream.pipe(gulp.dest(config.paths.dest + 'fonts/'))

  return


