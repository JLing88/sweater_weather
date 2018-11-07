class Api::V1::BackgroundsController < ApplicationController
  def index
    background = Background.new(params[:location])
    render json: background.images.sample
  end
end
