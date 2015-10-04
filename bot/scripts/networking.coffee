# Description:
#   An example controlling networking scenarios for you to play with.
#
# Commands:
#   hubot /iisreset <server> - Exec an iisreset
#   hubot /removeFromFarm <server> - Remove the requested server from the farm

delay = require './delay'

module.exports = (robot) ->
  robot.respond /\/iisreset (.*)/i, (msg) ->
    server = msg.match[1]
    msg.send "Executing an IISReset on #{server}"
    delay 4000, ->
      msg.send ">*Reset complete*"


  robot.respond /\/removeFromFarm (.*)/i, (msg) ->
    server = msg.match[1]
    msg.send "Removing #{server} from the server farm"
    delay 4000, ->
      msg.send ">*Removal complete*"
