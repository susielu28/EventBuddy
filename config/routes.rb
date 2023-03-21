Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # config/routes.rb

  resources :events do
    resources :comments, only: [:create]
    resources :event_members, only: [:create]
  end

  resources :comments, only: [:edit, :update, :destroy]
  resources :event_members, only: [:destroy]

  resources :users, only: [:index] # Adds a route for users index
  # ...

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
