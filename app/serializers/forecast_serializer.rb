class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_type :forecast
  set_id :city_state
  attributes :id,
             :current_weather,
             :weekly_forecast

end
