ipc = require('ipc')
mui = require('material-ui')
_ = require('lodash')
React = require('react/react')
streamTemplate = require('components/stream-list.jade')
#setInterval(=>
#  @stream.feedPull()
#, 6000)
Comp = React.createClass({
  render: -> streamTemplate()
})

React.render(
  React.createFactory(Comp)({name: 'React'}), document.body
);
