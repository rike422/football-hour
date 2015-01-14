Menu = require 'menu'
app = require 'app'
fs = require 'fs'
ipc = require 'ipc'
path = require 'path'
url = require 'url'
{EventEmitter} = require 'events'
_ = require 'lodash'
{spawn} = require 'child_process'
AppMenu = require './menu.js'
AppWindow = require './window.js'

class Application
  _.extend(@prototype, EventEmitter.prototype)

  constructor: (options) ->
    {@resourcePath, @version, @devMode } = options

    @pkgJson = require '../../package.json'
    @window = new AppWindow(options)
    @menu = new AppMenu(pkg: @pkgJson)
    app.on 'window-all-closed', (e) ->
      app.quit()
    @window.show()
    @menu.attachToWindow @window
    @handleMenuItems(@menu, @window)

  handleMenuItems: (menu, thisWindow) ->
    menu.on 'application:window-all-closed', -> app.quit()

    menu.on 'window:reload', ->
      thisWindow.reload()

    menu.on 'window:toggle-full-screen', ->
      thisWindow.toggleFullScreen()

    menu.on 'window:toggle-dev-tools', ->
      thisWindow.toggleDevTools()

  reload: -> @window.reload()

  exit: (status) -> app.exit(status)
module.exports = Application
