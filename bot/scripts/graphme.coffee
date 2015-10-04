# Description:
#   An example graphing scenario for you to play with.
#
# Commands:
#   hubot /graphme deploy.totals - Graph of recent deployments
#   hubot /graphme system.status - Current Status
#   hubot /graphme system.ex - Graphs the recent exceptions
#   hubot /graphme system.users - Graphs the recent user counts

module.exports = (robot) ->
  robot.respond /\/graphme deploy.totals/i, (msg) ->
    msg.send "https://raw.githubusercontent.com/paulwelden/HubotLabs/master/Images/Num%20Of%20Releases.png"

  robot.respond /\/graphme system.status/i, (msg) ->
    msg.send "https://raw.githubusercontent.com/paulwelden/HubotLabs/master/Images/System.Status.png"

  robot.respond /\/graphme system.ex/i, (msg) ->
    msg.send "https://raw.githubusercontent.com/paulwelden/HubotLabs/master/Images/exceptionCounts.png"

  robot.respond /\/graphme system.users/i, (msg) ->
    msg.send "https://raw.githubusercontent.com/paulwelden/HubotLabs/master/Images/activeUserCounts.png"
