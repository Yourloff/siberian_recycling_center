Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :acts
  resources :users
end
