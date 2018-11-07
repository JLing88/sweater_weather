class Background

  attr_reader :city_state

  def initialize(city_state)
    @city_state = city_state
  end

  private

  def geocoder_service
    GoogleService.new
  end

  def background_service
    FlickrService.new
  end

end
