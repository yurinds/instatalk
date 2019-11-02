# frozen_string_literal: true

class AddIsOnlineToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_online, :boolean
  end
end
