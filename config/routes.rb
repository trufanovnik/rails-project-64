# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :posts do
    scope module: :posts do
      resources :comments, only: [:create]
    end
  end
end
