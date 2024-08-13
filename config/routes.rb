Rails.application.routes.draw do
  devise_for :users

  resources :appointments do
    member do
      post :toggle_status
    end

    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end

  resources :symptoms

  root to: "pages#home"

  get "playground" => "pages#playground"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
