Rails.application.routes.draw do
  resources :group_events, only: [:show, :create]
  resources :events, only: [:create]
  resources :users, only: [:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
