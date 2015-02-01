gulp = require('gulp')
config = require('../config').run
exec = require("child_process").exec
## Watch tasks
gulp.task 'run', ->
  exec("#{config.bin} #{config.dir}")

gulp.task 'debug', ->
  console.log "#{config.bin} ./dist/"
  exec("#{config.bin} ./dist/", {env: {ATOM_DEV_MODE: 1}})

