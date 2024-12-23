Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      post "auth/login", to: "auth#login"
      post "auth/signup", to: "auth#signup"

      resources :exclusive_areas, only: %i[index create]

      namespace :admin do
        resources :users, only: %i[index]
      end
    end
  end
end
