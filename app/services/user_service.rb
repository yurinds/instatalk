# frozen_string_literal: true

class UserService
  def initialize(user:, is_online:)
    @user = user
    @is_online = is_online
  end

  def perform
    update_status!
    broadcast_all_users
  end

  private

  def update_status!
    @user.update! is_online: @is_online
  end

  def broadcast_all_users
    ActionCable.server.broadcast 'user_status_channel',
                                 users_online: render_users
  end

  def render_users
    ApplicationController.renderer.render(partial: 'users/user', collection: User.online_now)
  end
end
