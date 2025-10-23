Rails.application.routes.draw do
  root "pages#home"

  get "pages/home"
  get "/account", to: "users#account"
  get "/profile", to: "users#show", as: "user"
  get "/profile/edit", to: "users#edit", as: "edit_user"

  post "/profile/update", to: "users#update"

  resources :rooms
  resources :reservations

  devise_for :users,
             path: "",
             path_names: { sign_up: "register", sign_in: "login", edit: "edit", sign_out: "logout" },
             controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "pages/home"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  # Defines the root path route ("/")
  # root "posts#index"

  #before_action :configure_permitted_parameters, if: :devise_controller?
  #
  #protected
  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  #end
end
