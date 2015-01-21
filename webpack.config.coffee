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
        {test: /\.coffee$/, loader: 'coffee-loader'}
        {test: /\.css$/, loader: "style!css"},
        {test: /\.scss$/, loader: "style!css!sass?outputStyle=expanded&" +
            "includePaths[]=" +
            (path.resolve(__dirname, "./bower_components")) + "&" +
            "includePaths[]=" +
            (path.resolve(__dirname, "./node_modules"))
        },
        {test: /\.less$/, loader: 'style!raw!less'},
        {test: /\.js$/, loader: "jsx-loader?harmony" },
        {test: /\.jsx$/, loader: "jsx-loader?harmony" },
        {test: /\.woff$/, loader: 'url?limit=10000&minetype=application/font-woff'},
        {test: /\.ttf$/, loader: 'file'},
        {test: /\.eot$/, loader: 'file'},
        {test: /\.svg$/, loader: 'file'},
        {test: /\.json$/, loader: 'json-loader'},
        {test: /\.jade$/, loader: "react-jade-loader?split=true"}
        {test: /\.(gif|png|jpg)$/, loaders: 'image?optimizationLevel=7&interlaced=false'}
      ]
    resolve:
      extensions: ['', '.jsx', '.webpack.js', '.web.js', '.coffee', '.js', '.scss']
      modulesDirectories: ['app/js/rss', 'app/view', 'web_modules', 'bower_components', 'node_modules']
    externals: {
      #"react/react.js": "React",
      #"rx/dist/rx.all.js": "Rx"
    },
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