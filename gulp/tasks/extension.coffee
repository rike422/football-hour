gulp = require('gulp')
git = require('gulp-git')
_ = require("lodash")
mkdirp = require('mkdirp');
config = require('../config').extensions
extensions = require(config.setting).extensions
path = require('path')

gulp.task('extension:download', ->
  mkdirp.sync(config.dst)
  _.forIn(extensions, (v, k) ->
    installDir = path.join config.dst, v.url
    if path.existsSync(installDir)
      git.pull('origin', 'master', {cwd: installDir}, (e)->
        console.error e if e?
      )
    else
      git.clone(v, {cwd: config.dst}, (e)->
        console.error e?
      )
  )
)