Rails.application.routes.draw do
  namespace :front_end do
    namespace :v1 do
      resources :welcome, only: :index
    end
  end
end
