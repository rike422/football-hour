RssStream = require '../feed'

class BundesFeeds extends RssStream
  constructor: (url, name) ->
    @name = name
    super(url, "bundes", name)

module.exports = BundesFeeds
