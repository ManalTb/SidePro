require 'rails_helper'

RSpec.describe "Restos", type: :request do
  describe "GET /restos" do
    it "works! (now write some real specs)" do
      get restos_path
      expect(response).to have_http_status(200)
    end
  end
end
