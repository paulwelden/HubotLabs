# Description:
#   An example deployment scenario for you to play with.
#
# Commands:
#   hubot /deploy <system> to <enviornment>   Deploys the requested system.

module.exports = (robot) ->
  robot.respond /\/deploy (.*) to (.*)/i, (msg) ->
    system      = msg.match[1]
    enviornment = msg.match[2]
    msg.send "Beginning Deployment of #{system} to #{enviornment}"
    setTimeout ( ->
      msg.send "#{system} has been deployed to #{enviornment}"
      msg.send "Please verify"
    ), 5000
