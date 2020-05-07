# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'plays#home'
  get 'plays/home'
  get 'plays/game'
  post 'create_play_images', to: 'plays#create_play_images'
  post 'plays', to: 'plays#create'
end
