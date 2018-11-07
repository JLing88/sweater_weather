class FlickrService

  def image_data(coordinates)
    get_img_urls(get_json("/services/rest/?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}"))
  end

  private

  def get_img_urls(json)
    json[:photos][:photo].map do |photo_info|
      photo_info[:url_l]
    end.compact
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: :true)
  end

  def conn
    Faraday.new(url: "https://api.flickr.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['method'] = 'flickr.photos.search'
      faraday.params['tag'] = 'parks,buildings,landmarks'
      faraday.params['extras'] = 'url_l'
      faraday.params['nojsoncallback'] = '1'
      faraday.params['api_key'] = ENV['flickr_api_key']
      faraday.params['safe_search'] = '1'
      faraday.params['content_type'] = '1'
      faraday.params['per_page'] = '20'
      faraday.params['page'] = '1'
      faraday.params['format'] = 'json'
    end
  end
end
