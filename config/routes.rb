Rails.application.routes.draw do
  root 'events#index'
  resources :sessions, only: [:create, :destroy]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
