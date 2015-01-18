gulp = require("gulp")
gulpAtom = require("gulp-atom")
version = require('../config').atomVer
gulp.task "atom", ->
  gulpAtom
    srcPath: "./dist"
    releasePath: "./release"
    cachePath: "./cache"
    version: version
    rebuild: false
    platforms: [
      "darwin-x64"
    ]

