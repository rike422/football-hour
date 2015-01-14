ipc = require('ipc')
ipc.on('ping',(message) ->
  h1 = document.createElement 'h1'
  h1.innerText = "football-hour #{message}"
  document.body.appendChild h1
)

