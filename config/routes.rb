Rails.application.routes.draw do
  resources :welcome, only: :index
  resources :sessions, only: :create
  resources :users, only: :show
end
