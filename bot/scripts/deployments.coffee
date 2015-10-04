# Description:
#   An example deployment scenario for you to play with.
#
# Commands:
#   hubot deploy <system> to <enviornment>   Deploys the requested system.

Q = require 'q'




delay = (time, fn, args...) ->
  setTimeout fn, time, args...

module.exports = (robot) ->
  robot.respond /deploy (.*) to (.*)/i, (msg) ->
    deployment =
      system      : msg.match[1]
      enviornment : msg.match[2]



    beginRelease(msg, deployment)



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
