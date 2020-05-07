# frozen_string_literal: true

# app/models/play_image.rb
class PlayImage < ApplicationRecord
  has_many_attached :image
end
