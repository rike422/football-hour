gulp = require("gulp")
config = require("../config").reload
atom = undefined
inspector = undefined

spawn = (command, args) ->
  baby = require("child_process").spawn(command, args,
    detached: true
    stdio: [0, 1, 2]
  )
  baby.unref()
  baby

kill = (victim) ->
  victim.kill "SIGKILL"  if victim
  return

gulp.task "reload", (cb) ->
  kill atom
  kill inspector
  dbg = "--debug=#{config.port}"
  atom = spawn(config.command, [
    dbg
    config.module
  ])
  inspector = spawn("node-inspector")
  cb()
  return
