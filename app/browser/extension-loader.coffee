path = require 'path'
_ = require 'lodash'

class ExtensionLoader
  constructor: (window, list) ->
    @window = window
    @list = list

  addExtension: (name) ->
    @window.addDevToolsExtension(name)

  removeExtension: (name) ->
    @window.addDevToolsExtension(name)

  fullCustomize: ->
    _.forIn(@list, (v, k) =>
      console.log v
      extensionPath = path.join(__dirname, "../", "extensions", v.manifest)
      console.log "load #{extensionPath}"
      result = @addExtension(extensionPath)
    )

module.exports = ExtensionLoader