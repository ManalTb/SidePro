class TableRating < ActiveRecord::Migration
  def change
    create_table :ratings
    add_column :ratings, :mark, :integer
  end
end
