require "rails_helper"

RSpec.describe TestingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/testings").to route_to("testings#index")
    end

    it "routes to #new" do
      expect(:get => "/testings/new").to route_to("testings#new")
    end

    it "routes to #show" do
      expect(:get => "/testings/1").to route_to("testings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/testings/1/edit").to route_to("testings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/testings").to route_to("testings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/testings/1").to route_to("testings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/testings/1").to route_to("testings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/testings/1").to route_to("testings#destroy", :id => "1")
    end
  end
end
