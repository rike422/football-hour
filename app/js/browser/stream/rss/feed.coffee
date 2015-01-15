FeedParser = require 'feedparser'
request = require 'request'
events = require 'eventemitter2'

class RssStream extends events.EventEmitter2
  constructor: (url, leage, name) ->
    @url = url
    @leage = leage
    @name = name
    @line = []

  pull: (cb) ->
    stream = request(@url).pipe(new FeedParser)
    stream.on 'error', (err) =>
      cb err
    stream.on 'data', (chunk) =>
      feed = new RssFeed chunk
      @line.push feed
    stream.on 'end', =>
      cb null, @line


class RssFeed extends events.EventEmitter2
  constructor: (feed) ->
    @feed = feed

  toVueObj: ->
    {
      title: @feed.title
      url: @feed.url
      description: @feed.description
    }

exports = RssStream
