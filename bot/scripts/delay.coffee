# Description:
#   A quick utility for timeouts in coffeescript


module.exports = (time, fn, args...) ->
  setTimeout fn, time, args...
