lazy = require 'lazy.js'
events = require 'eventemitter2'
Q = require 'q'
BundesFeeds = require './js/browser/rss/germany/bundes-feed.coffee'

bundesFeeds = [
  new BundesFeeds("http://www.bundesliga.com/rss/jp/rss_news.xml", "kousiki")
]
@stream = new Vue({
  el: "#news-stream"
  data: {
    stream: []
  },
  methods: {
    feedPull: ->
      try
        lazy(bundesFeeds).each((channel) =>
          channel.pull((error, line) =>
            @$data.stream = lazy(@$data.stream).concat(lazy(line.map((feed) -> feed.toVueObj()))
            ).flatten().toArray()
          )
        )
      catch e
        console.log(e)
  }
})

@stream.feedPull()
#setInterval(=>
#  @stream.feedPull()
#, 6000)
