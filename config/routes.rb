Rails.application.routes.draw do
  # get 'sessions/new'
  # post 'sessions/create'
  
  # get 'registrations/new'
  # post 'registrations/create'
  # get 'registrations/create', to: 'registrations#new'
  # get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#index"
  resources :sessions, only: %i(new create)
  get 'sessions/destroy', as: "logout"
  resources :registrations, only: %i(new create)
end
