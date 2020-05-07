# frozen_string_literal: true

# app/controllers/plays_controller.rb
class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def home
    @play_images = PlayImage.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      render json: @play
    else
      render json: { error: 'something went wrong!' }
    end
  end

  def game
    images = PlayImage.all
                      .map { |play| play.image.attachments }
                      .flatten
                      .collect { |e| url_for(e).to_s }
    @random_images = images.shuffle.sample(rand(5..10))
    @plays = Play.all
  end

  def create_play_images
    @play_images = PlayImage.new(play_image_params)
    @play_images.save
    redirect_to plays_home_path
  end

  private

  def play_params
    params.require(:play).permit(:timer_count, :image_url)
  end

  def play_image_params
    params.require(:play_image).permit(image: [])
  end
end
