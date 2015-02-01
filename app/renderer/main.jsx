var ipc = require('ipc');
mui = require('material-ui');
React = require('react');
require("./components/stream/stream.jsx")
ipc.on('ping', function(message) {
  var h1 = document.createElement('h1');
  h1.innerText = "football-hour" + message;
  document.body.appendChild(h1);
});

//React.render( <Main />, document.body );