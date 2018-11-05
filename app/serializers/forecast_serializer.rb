class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_type :forecast
  set_id :city_state
  attributes :current_weather,
             :weekly_forecast,
             :hourly_forecast

end
