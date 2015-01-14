path = require("path")
BASE_DIR = __dirname + "../../"
BASE = (p) ->
  path.join BASE_DIR, p

DST_DIR = BASE("public")
HTML = BASE("app/view/index.jade")
RENDER_SCRIPTS = BASE("app/js/render/**/*.coffee")
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

    dst: DST_DIR

  reload:
    command: BASE("../atom-shell/Atom.app/Contents/MacOS/Atom")
    module: BASE(".").toString()
    port: 5858