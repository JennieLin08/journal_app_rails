class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
