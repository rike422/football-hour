gulp = require('gulp')
html = require('../config').html
jade = require 'gulp-jade'
livereload = require('gulp-livereload')

gulp.task "build:jade", ->
  gulp.src html.src
  .pipe(jade())
  .pipe(gulp.dest("./dist/view/"))
  .pipe(livereload())
  return