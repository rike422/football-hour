gulp = require('gulp')
livereload = require('gulp-livereload')
config = require('../config').run
gulp.task 'listen', ->
  livereload.listen({ basePath: "../../dist" })

gulp.task 'reload', (cb) ->
  console.log("test")
  livereload()
  cb()
