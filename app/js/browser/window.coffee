Menu = require 'menu'
app = require 'app'
path = require 'path'
url = require 'url'

{EventEmitter} = require 'events'
BrowserWindow = require 'browser-window'
_ = require 'lodash'

class AppWindow
  _.extend @prototype, EventEmitter.prototype

  constructor: (options) ->
    @loadSettings =
      bootstrapScript: require.resolve '../renderer/main'

    @loadSettings = _.extend(@loadSettings, options)

    windowOpts =
      width: 800
      height: 600
      title: options.title ? "You Should Set options.title"
      'web-preferences':
        'subpixel-font-scaling': true
        'direct-write': true

    windowOpts = _.extend(windowOpts, @loadSettings)

    @window = new BrowserWindow(windowOpts)

    @window.on 'closed', (e) =>
      this.emit 'closed', e

    @window.on 'devtools-opened', (e) =>
      @window.webContents.send 'window:toggle-dev-tools', true

    @window.on 'devtools-closed', (e) =>
      @window.webContents.send 'window:toggle-dev-tools', false

  show: ->
    targetPath = path.resolve(__dirname, '../', 'index.html')
    console.log targetPath

    targetUrl = url.format
      protocol: 'file'
      pathname: targetPath
      slashes: true
      query: { loadSettings: JSON.stringify(@loadSettings) }

    @window.loadUrl targetUrl
    @window.show()

  reload: ->
    @window.webContents.reload()

  toggleFullScreen: ->
    @window.setFullScreen(not @window.isFullScreen())

  toggleDevTools: ->
    @window.toggleDevTools()

  close: ->
    @window.close()
    @window = null

module.exports = AppWindow
