# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments, only: [:create], controller: 'posts/comments'
    resources :likes, only: %i[create destroy], controller: 'posts/likes'
  end
end
