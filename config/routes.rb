Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  post "/homes/guest_sign_in", to: "home#new_guest"
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
end
