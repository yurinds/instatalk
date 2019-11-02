# frozen_string_literal: true

class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info 'Subscribed to UserStatusChannel'

    stream_from 'user_status_channel'

    speak('is_online' => true)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

    logger.info 'Unsubscribed to UserStatusChannel'

    speak('is_online' => false)
  end

  def speak(data)
    logger.info "UserStatusChannel, speak: #{data.inspect}"

    UserService.new(
      user: current_user, is_online: data['is_online']
    ).perform
  end
end
