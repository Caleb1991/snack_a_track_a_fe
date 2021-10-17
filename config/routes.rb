Rails.application.routes.draw do
  root 'welcome#index'
  resources :welcome, only: :index
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:show, :new, :create]
end
