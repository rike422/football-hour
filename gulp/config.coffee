path = require("path")
BASE_DIR = __dirname + "../../"
BASE = (p) ->
  path.join BASE_DIR, p

ATOM_VERSION = "v0.20.5"
RELEASE_DIR = BASE("release")
BUILD_DIR = BASE("dist")
HTML = BASE("app/view/**/*.jade")
RENDER_SCRIPTS = BASE("app/renderer/**/*.*")
BROWSER_SCRIPTS  = [BASE("app/browser/**/*.coffee")]
STYLES = BASE("app/css/**/*.scss")
MENUS = BASE ("app/menus/**/*.*")
PACKAGE_JSON = BASE("app/package.json")
module.exports =
  bundle:
    src: BASE("src/assets/**/*")
    dst: BUILD_DIR
  html:
    src: HTML
    dst: BUILD_DIR
  settings:
    menu: MENUS
  extensions:
    setting: PACKAGE_JSON
    dst: "#{BUILD_DIR}/extensions"
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
    bin: path.join("./bin", "Atom.app/Contents/MacOS/Atom")
    dir: BUILD_DIR
    module: BASE(".").toString()
