gulp = require('gulp');

requireDir = require('require-directory');
requireDir(module, './gulp/tasks');

gulp.task('build', ['clean', 'extension:download', 'build:jade', 'build:renderer', 'build:browser', 'copy:config'])
gulp.task('default', [], ->
  gulp.start('build')
  gulp.start("atom")
)
