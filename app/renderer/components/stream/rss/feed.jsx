var FeedParser = require('feedparser');
var request = require('request');
var events = require('eventemitter2');

class RssStream extends events.EventEmitter2 {
  constructor(url, leage, name) {
    this.url = url;
    this.leage = leage;
    this.name = name;
    this.line = [];
  }

  pull(cb) {
    var stream = request(this.url).pipe(new FeedParser)
    stream.on('error', function (err) {
        if(err == null) {
        }
      }
    )
    stream.on('data', function (chunk){
      var feed = new RssFeed();
      this.push(feed);
    });

    stream.on('end', function() {
      cb(null, this.line);
    });
  }
}
class RssFeed extends events.EventEmitter2 {
  constructor(feed) {
    this.feed = feed;
  }

  get toVueObj(){
    return {
      title: this.feed.title,
      url: this.feed.url,
      description: this.feed.description
    };
  }
}
exports = RssStream;
