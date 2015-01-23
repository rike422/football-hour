path = require("path")
BASE_DIR = __dirname + "../../"
BASE = (p) ->
  path.join BASE_DIR, p

ATOM_VERSION = "v0.20.4"
DST_DIR = BASE("public")
RELEASE_DIR = BASE("release")
BUILD_DIR = BASE("dist")
HTML = BASE("app/view/**/*.jade")
RENDER_SCRIPTS = BASE("app/js/renderer/**/*.coffee")
BROWSER_SCRIPTS  = BASE("app/js/browser/**/*.coffee")
STYLES = BASE("app/css/**/*.scss")
MENUS = BASE ("app/menus/**/*.*")

module.exports =
  bundle:
    src: BASE("src/assets/**/*")
    dst: DST_DIR
  html:
    src: HTML
    dst: DST_DIR
  settings:
    menu: MENUS
  watch:
    src:
      html: HTML
      styles: STYLES
      scripts:
        browser: BROWSER_SCRIPTS
        renderer: RENDER_SCRIPTS
    dst: BUILD_DIR
  atomVer: ATOM_VERSION
  run:
    bin: path.join(RELEASE_DIR, ATOM_VERSION, "darwin-x64", "Atom.app/Contents/MacOS/Atom")
    dir: BUILD_DIR
    module: BASE(".").toString()
