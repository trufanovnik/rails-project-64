class AddCategoryToPost < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.string :category_id
    end
  end
end
