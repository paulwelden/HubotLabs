# Description:
#   Examples of other scenarios

# Commands:
#   hubot /requestPTO <date> - Formally request PTO
#   hubot /givemepager <minutes> - Claim the pager for a specific unit of time

module.exports = (robot) ->
  robot.respond /\/iisreset (.*)/i, (msg) ->
    dt = msg.match[1]
    msg.send "Your request for #{dt} has been submitted"

  robot.respond /\/givemepager ([0-9]+)/i, (msg) ->
    minutes = msg.match[1]
    msg.send "The pager is yours for the next #{minutes} minutes"
