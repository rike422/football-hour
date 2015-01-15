# See webpack.config.js for more examples:
# https://github.com/webpack/webpack-with-common-libs/blob/master/webpack.config.js

path = require 'path'
webpack = require 'webpack'
# webpack-dev-server options used in gulpfile
# https://github.com/webpack/webpack-dev-server
module.exports =
  coffee:
    contentBase: "#{__dirname}/app"
    cache: true
    target: "atom"
    entry:
      app: './app/js/renderer/main'

    output:
      path: path.join(__dirname, 'dist', 'renderer')
      publicPath: 'dist/renderer/'
      filename: 'main.js'
      chunkFilename: '[chunkhash].js'
    module:
      loaders: [
        {
          test: /\.coffee$/
          loader: 'coffee-loader'
        }
        {
          test: /\.scss$/
          loader: "style-loader!sass-loader?outputStyle=expanded&includePaths[]=./bower_components/foundation/scss/"
        }
        {
          test: /\.css$/
          loader: 'style-loader!css-loader'
        }
      ]
    resolve:
      extensions: ['', '.webpack.js', '.web.js', '.coffee', '.js', '.scss']
      modulesDirectories: ['app/js/rss', 'web_modules', 'bower_components', 'node_modules']
    plugins: [
      new webpack.ResolverPlugin([
        new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin('bower.json', ['main'])
      ])
    ]

  jade:
    contentBase: "#{__dirname}/src/"
    cache: true
    entry:
      app: './app/view/index.jade'

    output:
      path: path.join(__dirname, 'dist')
      publicPath: 'dist/view'
      filename: '[name].html'
      chunkFilename: '[chunkhash].html'
    module:
      loaders: [
        {
          test: /\.jade/
          loader: 'jade-loader'
        }
      ]
    resolve:
      extensions: ['', '.jade']
      plugins: []