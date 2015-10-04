# Description:
#   An example graphing scenario for you to play with.
#
# Commands:
#   hubot graph me deploy.totals - Graph of recent deployments
#   hubot graph me system.status - Current Status

module.exports = (robot) ->
  robot.respond /graph me deploy.totals/i, (msg) ->
    msg.send "https://raw.githubusercontent.com/paulwelden/HubotLabs/master/Images/Num%20Of%20Releases.png"

  robot.respond /graph me system.status/i, (msg) ->
    msg.send "https://raw.githubusercontent.com/paulwelden/HubotLabs/master/Images/System.Status.png"
