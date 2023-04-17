# frozen_string_literal: true

class AddUserIdAndPostIDintoComment < ActiveRecord::Migration[7.0]
  def change
    change_table :post_comments do |t|
      t.string :post_id
      t.string :user_id
    end
  end
end
