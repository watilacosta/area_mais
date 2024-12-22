Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      post "auth/login", to: "auth#login"
      post "auth/signup", to: "auth#signup"

      namespace :admin do
        resources :users, only: %i[index]
      end
    end
  end
end
