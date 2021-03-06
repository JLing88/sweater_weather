require 'rails_helper'

describe "As a user" do
  context "they send a request to /api/v1/backgrounds" do
    it "returns a random image based on the location" do
      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful
    end
  end
end
