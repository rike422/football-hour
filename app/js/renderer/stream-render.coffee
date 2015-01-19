ipc = require('ipc')
mui = require('material-ui')
_ = require('lodash')
streamTemplate = require('components/stream-list.jade')
stream = require('react/react')

Comp = React.createClass({
  render: -> streamTemplate()
})

React.render(
  React.createFactory(Comp)({name: 'React'}), document.body
)
