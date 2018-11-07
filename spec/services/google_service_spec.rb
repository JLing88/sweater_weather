require "rails_helper"

describe "GoogleService", type: :service do
  it "returns lat/long for a given city" do
    VCR.use_cassette("google_service") do
      service = GoogleService.new
      results = service.get_lat_long("/maps/api/geocode/json?address=denver+co&key=#{ENV["google_api_key"]}&region=es")
      expect(results).to eq({:lat=>39.7392358, :lng=>-104.990251})
    end
  end
end
