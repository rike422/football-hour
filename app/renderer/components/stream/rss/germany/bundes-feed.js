RssStream = require('js/renderer/components/stream/rss/feed');

class BundesFeeds extends RssStream {
  constructor(url, name) {
    this.name = name;
    super(url, "bundes", name);
  }
}
module.exports = BundesFeeds;
