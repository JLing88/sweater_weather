class GoogleService

  def get_lat_long(city_state)
    get_json("/maps/api/geocode/json?address=#{city_state})}&key=#{ENV["google_api_key"]}&region=es")[:results].first[:geometry][:location]
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
