remote = require 'remote'
chokidar = require 'chokidar'
module.exports =
  class LiveReload
    constructor: (dirs...) ->
      @dirs = dirs

    watch: ->
      @dirs.forEach((dir) ->
        chokidar.watch('.', {ignored: /[\/\\]\./}).on('all', (event, path) ->
          remote.getCurrentWindow().reload()
        )
      )