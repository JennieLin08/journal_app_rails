class AddIsDeletedToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :is_deleted, :boolean, default: false
  end
end
