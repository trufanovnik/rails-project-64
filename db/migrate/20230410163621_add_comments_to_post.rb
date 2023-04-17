# frozen_string_literal: true

class AddCommentsToPost < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.string :post_comment_id
    end
  end
end
