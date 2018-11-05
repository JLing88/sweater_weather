require 'rails_helper'

describe 'DarkSkyService', type: :service do
  it 'returns the forecast for given coordinates' do
    coordinates = {:lat=>39.7392358, :lng=>-104.990251}
    service = DarkSkyService.new
    results = service.get_forecast(coordinates)
    expect(results.count).to eq(9)
  end
end
