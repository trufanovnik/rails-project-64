# frozen_string_literal: true

class AddCountLikesToPost < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.integer :count_of_likes
    end
  end
end
