class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = google_service.get_lat_long("/maps/api/geocode/json?address=#{params[:location].gsub(/[,]/, "+")}&key=#{ENV["google_api_key"]}&region=es")
  end

  private

  def google_service
    GoogleService.new
  end
end
