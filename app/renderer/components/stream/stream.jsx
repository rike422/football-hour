var mui = require('material-ui');
var _ = require('lodash');
var React = require('react');
var template = require('./stream.jade');
var mixins = require('../../lib/react-mixins.js');

var Stream = React.createClass({
  mixins: [mixins.JadeMixin],
  getDefaultProps: function() {
    return {
      id: 1
    };
  },
  template: template,
  render: function() {
    return this.renderTemplate({});
  }
});

var component = React.render(<Stream name='mugamuga' />, document.body);
