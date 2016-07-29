class Snack < ActiveRecord::Base
	belongs_to :category

	

	validates :brand, presence: {
		message: "Brand required"
	}

	validates :adress, presence: {
		message: "Adress required"
	}
end
