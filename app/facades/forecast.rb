class Forecast
  attr_reader :city_state,
              :forecast,
              :coordinates

  def initialize(city_state)
    @city_state = city_state
  end

  def current_weather
    forecast[:currently]
  end

  def weekly_forecast
    forecast[:daily]
  end

  def hourly_forecast
    forecast[:hourly]
  end

  def forecast
    @forecast ||= weather_service.get_forecast(coordinates)
  end

  def coordinates
    @coordinates ||= geocoder_service.get_lat_long(@city_state)
  end

  private

  def geocoder_service
    GoogleService.new
  end

  def weather_service
    DarkSkyService.new
  end
end
