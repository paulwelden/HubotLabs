# Description:
#   An example deployment scenario for you to play with.
#
# Commands:
#   hubot deploy <system> to <enviornment>   Deploys the requested system.

module.exports = (robot) ->
  robot.respond /deploy (.*) to (.*)/i, (msg) ->
    system      = msg.match[1]
    enviornment = msg.match[2]

    robot.emit 'slack-attachment',
              channel: msg.message.room
              fallback: """
              >>>Beginning Deployment of *#{system}* to *#{enviornment}*
              """
              content:
                color: "good",
                fields:
                  [
                    {
                      title: "Deployment has begun",
                      value: "Beginning Deployment of #{system} to #{enviornment}"
                    }
                  ]

    setTimeout ( ->
      msg.send ">Release complete. Please verify and monitor for errors"
    ), 5000
