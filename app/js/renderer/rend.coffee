ipc = require("ipc")

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
