class TableSnacks < ActiveRecord::Migration
  def change
  	create_table :snacks
  	add_column :snacks, :brand, :string
  	add_column :snacks, :adress, :string
  	add_column :snacks, :comment, :text
  end
end
