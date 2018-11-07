require 'rails_helper'

describe "As a User", type: :request do
  context "they send request to /api/v1/forecast" do
    VCR.use_cassette('get_forecast') do
      it 'returns the forecast for that location' do
        get '/api/v1/forecast?location=denver,co'

        expect(response).to be_successful

        result = JSON.parse(response.body, symbolize_names: :true)

        expect(result[:data][:attributes]).to have_key(:current_weather)
        expect(result[:data][:attributes]).to have_key(:weekly_forecast)
        expect(result[:data][:attributes]).to have_key(:hourly_forecast)
        expect(result[:data][:attributes][:current_weather].count).to eq(19)
        expect(result[:data][:attributes][:weekly_forecast][:data].count).to eq(8)
        expect(result[:data][:attributes][:hourly_forecast][:data].count).to eq(49)
      end
    end
  end
end
