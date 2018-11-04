require 'rails_helper'

RSpec.describe "Latitude/Longitude", type: :request do
  it "returns lat and long coordinates for a city" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result).to eq({:lat=>39.7392358, :lng=>-104.990251})
  end
end
