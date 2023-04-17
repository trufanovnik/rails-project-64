# frozen_string_literal: true

class AddUserIdToPostLikes < ActiveRecord::Migration[7.0]
  def change
    change_table :post_likes do |t|
      t.integer :post_id
    end
  end
end
