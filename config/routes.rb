Rails.application.routes.draw do
  resources :welcome, only: :index
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:show, :new, :create]
end
