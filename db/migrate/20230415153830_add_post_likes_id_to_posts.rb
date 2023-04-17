# frozen_string_literal: true

class AddPostLikesIdToPosts < ActiveRecord::Migration[7.0]
  def change
    change_table :post_likes do |t|
      t.integer :user_id
    end
  end
end
