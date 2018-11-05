class Api::V1::ForecastController < ApplicationController
  def index
    binding.pry
    forecast = Forecast.new(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
