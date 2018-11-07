class FlickrService

  def image_date(coodinates)
    get_json("/rest/lat=#{coordinates[:lat]}/long=#{coordinates[:long]}")
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: :true)

  def conn
    Faraday.new(url: "https://api.flickr.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["method"] = "flickr.photos.getRecent"
      faraday.params["tag"] = "park,building"
      faraday.params["extras"] = "url_l"
      faraday.params["nojsoncallback"] = "1"
      faraday.params["api_key"] = ENV["flickr_api_key"]
      faraday.params["safe_search"] = "1"
      faraday.params["content_type"] = "1"
      faraday.params["per_page"] = "20"
    end
  end
end
