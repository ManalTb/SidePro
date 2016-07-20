class AddCategoryIdToSnacks < ActiveRecord::Migration
  def change
  	add_column :snacks, :category_id, :integer
  	add_index :snacks, :category_id
  end
end
