gulp = require('gulp')
html = require('../config').html
jade = require 'gulp-jade'

gulp.task "build:jade", ->
  gulp.src html.src
  .pipe(jade())
  .pipe(gulp.dest("./dist/view/"))
  return