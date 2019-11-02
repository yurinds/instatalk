# frozen_string_literal: true

class User < ApplicationRecord
  before_create :generate_nickname

  scope :online_now, -> { where(is_online: true) }

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
