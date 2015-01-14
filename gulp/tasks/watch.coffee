gulp = require('gulp')
config = require('../config')
## Watch tasks
gulp.task 'watch', ->
  gulp.watch config.watch.src.scripts.browser, ['build:browser']
  gulp.watch config.watch.src.scripts.renderer, ['build:renderer']
  gulp.watch config.watch.src.styles, ['webpack']
  gulp.watch config.watch.src.html, ['build:jade']
  gulp.watch('./dist/**/*')