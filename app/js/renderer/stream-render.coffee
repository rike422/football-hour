ipc = require('ipc')
mui = require('material-ui')
_ = require('lodash')
React = require 'react/react'
streamTemplate = require('components/stream-list.jade')

Hello = React.createClass({
  propTypes: {
    name: React.PropTypes.string.isRequired,
  },
  render: -> streamTemplate()
})

React.render(React.createFactory(Hello)({name: "foo"}), document.body);
