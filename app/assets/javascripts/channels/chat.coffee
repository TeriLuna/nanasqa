$(document).ready ->

  App.chat = App.cable.subscriptions.create({channel: "ChatChannel", chatroom: $(".js-user-id").data("chatroom")},
    connected: ->
      console.log("connected")
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->

      $('#messages').removeClass 'hidden'
      $('#messages').append @renderMessage(data)
      $('.js-message-content').val("")
    renderMessage: (data) ->
      '<p> <b>' + data.user + ': </b>' + data.message + '</p>'
  )
