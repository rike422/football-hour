RssStream = require 'js/renderer/components/stream/rss/feed'

class BundesFeeds extends RssStream
  constructor: (url, name) ->
    @name = name
    super(url, "bundes", name)

module.exports = BundesFeeds
