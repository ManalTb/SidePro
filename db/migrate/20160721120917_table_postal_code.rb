class TablePostalCode < ActiveRecord::Migration
  def change
  	create_table :postalcodes
  	add_column :postalcodes, :code, :integer
  end
end
