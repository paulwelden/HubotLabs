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
      robot.emit 'slack-attachment',
                channel: msg.message.room
                fallback: """
                >>>Deployment of *#{system}* to *#{enviornment}* is complete
                """
                content:
                  color: "good",
                  fields:
                    [
                      {
                        title: "Deployment complete",
                        value: "Deployment of #{system} to #{enviornment} is complete"
                      }
                    ]
    ), 5000
