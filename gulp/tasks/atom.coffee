gulp = require("gulp")
gulpAtom = require("gulp-atom")
gulp.task "atom", ->
  gulpAtom
    srcPath: "./dist"
    releasePath: "./release"
    cachePath: "./cache"
    version: "v0.20.4"
    rebuild: false
    platforms: [
      "darwin-x64"
    ]

