class FlickrService

  def images(coordinates)
    get_json("/services/rest/?method=flickr.photos.search&lat=#{coordinates[:lat]}&lon=#{longitude}&per_page=10&page=1"))
  end

  private

  def conn
    Faraday.new(url: "https://api.flickr.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['flickr_api_key']
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: :true)
  end
end
