Rails.application.routes.draw do
  resources :group_events, only: [:show, :create]
  resources :events, only: [:index, :create]
  resources :users, only: [:index, :show, :create]
  post "login", to: "authentication#login"
end
