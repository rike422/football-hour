gulp = require('gulp')
config = require('../config')
livereload = require('gulp-livereload')
## Watch tasks
gulp.task 'watch',['listen'], ->
  livereload.listen({ basePath: "../../dist" })
  gulp.watch config.watch.src.scripts.browser, ['build:browser']
  gulp.watch config.watch.src.scripts.renderer, ['build:renderer']
  gulp.watch config.watch.src.styles, ['webpack']
  gulp.watch config.watch.src.html, ['build:jade']
  gulp.watch('./dist/**/*')
