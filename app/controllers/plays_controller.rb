# frozen_string_literal: true

# app/controllers/plays_controller.rb
class PlaysController < ApplicationController
  def home
    @play_images = PlayImage.new
  end

  def create_play_images
    @play_images = PlayImage.new(play_image_params)
    @play_images.save
    redirect_to plays_home_path
  end

  private

  def play_image_params
    params.require(:play_image).permit(image: [])
  end
end
