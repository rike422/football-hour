gulp = require('gulp');

requireDir = require('require-directory');
requireDir(module, './gulp/tasks');

gulp.task('build', ['clean', 'build:jade','build:renderer', 'build:browser', 'copy:config'])
gulp.task('default', [], ->
  gulp.start('build')
)

#bower = require 'bower'
#gulp = require 'gulp'
#coffee = require 'gulp-coffee'
#concat = require 'gulp-concat'
#plumber = require 'gulp-plumber'
#sass = require 'gulp-sass'
#del = require('del');
#sourcemaps = require 'gulp-sourcemaps'
#NodeWebkitBuilder = require "node-webkit-builder"
#livereload = require 'gulp-livereload'
#
#sources =
#    coffee: [
#        'app/src/js/source/**/*.coffee',
#        'app/src/js/index.coffee'
#    ]
#    scss: 'app/src/css/**/*.scss'
#    jade: 'app/src/view/**/*.jade'
#    img: 'app/src/img/**/*.*'
#    config: "package.json"
#
#
#libs =
#    js: [
#        'vue/dist/vue.js'
#    ]
#    css: ['bootstrap/dist/**/*.min.css']
#    static: ['bootstrap/dist/**/*']
#
#gulp.task "compile:jade", ->
#    gulp.src sources.jade
#    .pipe(jade())
#    .pipe gulp.dest("./dist/")
#    return
#
#gulp.task 'copy:img', ->
#    gulp.src sources.img
#    .pipe gulp.dest './dist/img'
#    return
#
#gulp.task 'copy:config', ->
#    gulp.src sources.config
#    .pipe gulp.dest './dist/'
#    return
#
#gulp.task 'clean:release', (cb)->
#    del ["release"], cb
#    return
#
#gulp.task 'compile:coffee', ->
#    gulp.src sources.coffee
#    .pipe plumber()
#    .pipe sourcemaps.init
#        loadMaps: true
#    .pipe coffee
#        bare: true
#    .pipe concat 'app.js'
#    .pipe sourcemaps.write '.',
#        addComment: true
#        sourceRoot: sources.coffee
#    .pipe gulp.dest './dist'
#    return
#
#gulp.task 'compile:scss', ->
#    gulp.src sources.scss
#    .pipe plumber()
#    .pipe sass()
#    .pipe concat 'app.css'
#    .pipe gulp.dest './dist'
#    return
#
#gulp.task 'watch', ->
#    livereload.listen();
#    gulp.watch sources.coffee, ['compile:coffee']
#    gulp.watch sources.scss, ['compile:css']
#    gulp.watch sources.jade, ['compile:jade']
#    gulp.watch sources.bower, ['compile:lib']
#    gulp.watch sources.coffee, ['compile:coffee']
#    gulp.watch sources.img, ['copy:img']
#    gulp.watch('./dist/**/*').on('change', livereload.changed);
#    return
#
#gulp.task 'compile:lib', ->
#    bower.commands.install().on 'end', ->
#        gulp.src libs.js.map (e) -> "bower_components/#{e}"
#        .pipe concat 'lib.js'
#        .pipe gulp.dest 'dist/'
#        gulp.src libs.css.map (e) -> "bower_components/#{e}"
#        .pipe concat 'lib.css'
#        .pipe gulp.dest 'dist/'
#        gulp.src libs.static.map (e) -> "bower_components/#{e}"
#        .pipe gulp.dest 'dist/'
#
## --------------------------------------
## * Tasks to package this app
## * --------------------------------------
#gulp.task "release", ["clean:release", "build"], (cb) ->
#
#    # Read package.json
#    package_ = require("./package.json")
#    # Find out which modules to include
#    modules = []
#    unless not package_.dependencies
#        modules = Object.keys(package_.dependencies).filter((m) ->
#            m isnt "nodewebkit"
#        ).map((m) ->
#            "./node_modules/" + m + "/**/*"
#        )
#
#    # Which platforms should we build
#    platforms = []
#    platforms.push "win"  if process.argv.indexOf("--win") > -1
#    platforms.push "osx"  if process.argv.indexOf("--mac") > -1
#    platforms.push "linux32"  if process.argv.indexOf("--linux32") > -1
#    platforms.push "linux64"  if process.argv.indexOf("--linux64") > -1
#
#    # Build for All platforms
#    if process.argv.indexOf("--all") > -1
#        platforms = [
#            "win"
#            "osx"
#            "linux32"
#            "linux64"
#        ]
#
#    # If no platform where specified, determine current platform
#    unless platforms.length
#        if process.platform is "darwin"
#            platforms.push "osx"
#        else if process.platform is "win32"
#            platforms.push "win"
#        else if process.arch is "ia32"
#            platforms.push "linux32"
#        else platforms.push "linux64"  if process.arch is "x64"
#
#    # Initialize NodeWebkitBuilder
#    nw = new NodeWebkitBuilder(
#        files: [
#            "./package.json"
#            "./dist/*"
#        ].concat(modules)
#        cacheDir: "./dist/cache"
#        platforms: platforms
#    #macIcns: "./app/assets/icons/mac.icns"
#    #winIco: "./app/assets/icons/windows.ico"
#        checkVersions: false
#    )
#    nw.on "log", (msg) ->
#
#        # Ignore 'Zipping... messages
#        console.log msg  if msg.indexOf("Zipping") isnt 0
#        return
#    nw.build()
#gulp.task 'build', ["copy:config", 'copy:img', 'compile:lib', 'compile:coffee', 'compile:scss', 'compile:jade']
#gulp.task 'default', ['build']
####
