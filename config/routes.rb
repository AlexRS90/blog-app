# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/users/:user_id/posts/:post_id/destroy_comment', to: 'comments#destroy', as: 'destroy_comment' # destroy
  post '/users/:user_id/posts/:post_id/destroy_comment', to: 'comments#destroy' # destroy

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  root 'users#index'
end

