# frozen_string_literal: true

class AddnamedCreatorToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :creator, :string
  end
end
