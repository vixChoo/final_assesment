require 'rails_helper'

RSpec.describe "Testings", type: :request do
  describe "GET /testings" do
    it "works! (now write some real specs)" do
      get testings_path
      expect(response).to have_http_status(200)
    end
  end
end
