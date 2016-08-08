class AddRatingsIdToSnacks < ActiveRecord::Migration
  def change
    add_column :ratings, :snack_id, :integer
    add_index :ratings, :snack_id
  end
end
