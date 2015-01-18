gulp = require "gulp"
webpack = require 'gulp-webpack'
coffee = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
plumber = require 'gulp-plumber'
config = require '../../webpack.config.coffee'
browser = "app/js/browser/**/*.coffee"

gulp.task "build:browser", ->
  gulp.src browser
  .pipe plumber()
  .pipe sourcemaps.init
    loadMaps: true
  .pipe coffee
    bare: true
  .pipe sourcemaps.write '.',
    addComment: true
    sourceRoot: browser
  .pipe gulp.dest './dist/browser'
  return

gulp.task 'copy:config', ->
  gulp.src ['app/menus/**/*']
  .pipe gulp.dest './dist/menus'
  gulp.src ['app/package.json']
  .pipe gulp.dest './dist'
  return

gulp.task "build:renderer", ->
  gulp.src("app/js/render/main.coffee")
  .pipe(webpack(config.coffee))
  .pipe gulp.dest("dist/renderer/")