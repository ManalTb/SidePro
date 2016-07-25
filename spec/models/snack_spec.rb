require 'rails_helper'

RSpec.describe Snack, type: :model do
	it "creates with no args" do
	#expect(1).to eq 1 
	  expect { Snack.create brand: "Mcdo"}.to  change{ Snack.count }.by(1)
    end

end
