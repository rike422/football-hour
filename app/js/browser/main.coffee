app = require 'app'
BrowserWindow = require 'browser-window'
Application = require './application.js'
nslog = console.log
fs = require 'fs'
path = require 'path'
global.shellStartTime = Date.now()

process.on('error', (err) ->
  console.log(err);
)

parseCommandLine = ->
  version = app.getVersion()

  yargs = require('yargs')
  .alias('h', 'help').boolean('h').describe('h', 'Print this usage message.')
  .alias('r', 'resource-path').string('r').describe('r',
    'Set the path to the App source directory and enable dev-mode.')
  .alias('v', 'version').boolean('v').describe('v', 'Print the version.')

  args = yargs.parse(process.argv[1..])

  process.stdout.write(JSON.stringify(args) + "\n")

  if args.help
    help = ""
    yargs.showHelp((s) -> help += s)
    process.stdout.write(help + "\n")
    process.exit(0)

  if args.version
    process.stdout.write("#{version}\n")
    process.exit(0)

  if args['resource-path']
    devMode = true
    resourcePath = args['resource-path']

  unless fs.statSyncNoException(resourcePath)
    resourcePath = path.dirname(path.dirname(__dirname))

  resourcePath = path.resolve(resourcePath)

  {resourcePath, version, devMode}

process.on 'uncaughtException', (error = {}) ->
  nslog(error.message) if error.message?
  nslog(error.stack) if error.stack?

start = ->
  # Enable ES6 in the Renderer process
  app.commandLine.appendSwitch 'js-flags', '--harmony'
  args = parseCommandLine()
  app.on 'ready', ->
    global.application = new Application(args)
    console.log("App load time: #{Date.now() - global.shellStartTime}ms") unless args.test
start()
