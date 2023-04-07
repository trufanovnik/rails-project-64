# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  get 'home/index'
  devise_for :users
  resources :category
  root 'home#index'
end
