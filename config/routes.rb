Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # config/routes.rb

  resources :events do
    resources :comments, only: [:create]
    resources :event_members, only: [:create]
    post "attend", to: "events#attend", as: "attend"
    delete "unattend", to: "events#unattend", as: "unattend"
  end

  resources :comments, only: [:edit, :update, :destroy]
  resources :event_members, only: [:destroy]

  resources :users, only: [:index, :show] do
    resources :chatrooms, only: :create
    get :my_events, on: :collection
    get :my_chats, on: :collection
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :profiles, only: [:edit, :update]

  get '/search', to: 'events#search'

  post "/tag", to: "users#tag"
  # ...

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
