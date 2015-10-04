# Description:
#   An example deployment scenario for you to play with.
#
# Commands:
#   hubot deploy <system> to <enviornment>   Deploys the requested system.
#   hubot /deployed - Lists the recent deployments

delay = require './delay'

module.exports = (robot) ->

  beginRelease = (msg, deployment) ->
    reployToChat(msg, "Deployment has begun", "Initiating #{deployment.system} to #{deployment.enviornment}")
    delay 1000, ->
      deployDatabase(msg, deployment)

  deployDatabase = (msg, deployment) ->
    reployToChat(msg, "Database", "Publishing #{deployment.system}DB" )
    delay 5000, ->
      deployApplication(msg, deployment)


  deployApplication = (msg, deployment) ->
    reployToChat(msg, "Application", "Publishing #{deployment.system}" )
    delay 3000, ->
      completed(msg, deployment)

  completed = (msg, deployment) ->
    robot.emit 'slack-attachment',
            channel: msg.message.room
            fallback: """
            Deployment has completed"
            """
            content:
              color: "good",
              pretext: "<https://github.com/paulwelden/HubotLabs|Deployment has completed>!",
              fields:
                [
                  {
                    value: "#{deployment.system} is ready for verification"
                  }
                ]

  reployToChat = (msg, pretext, msgValue) ->
    robot.emit 'slack-attachment',
            channel: msg.message.room
            fallback: """
            #{msgValue}
            """
            content:
              color: "good",
              pretext: "#{pretext}",
              fields:
                [
                  {
                    value: "#{msgValue}"
                  }
                ]


  robot.respond /deploy (.*) to (.*)/i, (msg) ->
    deployment =
      system      : msg.match[1]
      enviornment : msg.match[2]

    beginRelease(msg, deployment)

  robot.respond /(\/deployed|\/deploys|\/deployments)/i, (msg) ->
    robot.emit 'slack-attachment',
            channel: msg.message.room
            fallback: """
            17 Deployments have been performed in the last 24 hours
            """
            content:
              pretext: "Recent Deployments",
              fields:
                [
                  {
                    value: "1: ApplicationAlpha (1.5.6)"
                  },
                  {
                    value: "2: Greeeeeat (7.0.2)"
                  },
                  {
                    value: "3: Really New (0.0.1)"
                  },
                  {
                    value: "4: Very Old (107.1.200)"
                  }
                ]
