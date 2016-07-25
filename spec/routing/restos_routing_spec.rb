require "rails_helper"

RSpec.describe RestosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restos").to route_to("restos#index")
    end

    it "routes to #new" do
      expect(:get => "/restos/new").to route_to("restos#new")
    end

    it "routes to #show" do
      expect(:get => "/restos/1").to route_to("restos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restos/1/edit").to route_to("restos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restos").to route_to("restos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/restos/1").to route_to("restos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/restos/1").to route_to("restos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restos/1").to route_to("restos#destroy", :id => "1")
    end

  end
end
