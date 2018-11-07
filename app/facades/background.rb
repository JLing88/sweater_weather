class Background

  attr_reader :city_state

  def initialize(city_state)
    @city_state = city_state
  end

  def images
    background_service.image_data(coordinates)
  end

  private

  def coordinates
    @coordinates ||= geocoder_service.get_lat_long(@city_state)
  end

  def geocoder_service
    GoogleService.new
  end

  def background_service
    FlickrService.new
  end

end
