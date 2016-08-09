class AddRatingsIdToSnacks < ActiveRecord::Migration
# Nom incohérent! AddSnackIdToRatings ici ...
  def change
    add_column :ratings, :snack_id, :integer
    add_index :ratings, :snack_id
  end
end
