

Rails.application.routes.draw do


  root 'gossips#index'

  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome/:first_name', to: 'static_pages#welcome'
  resources :gossips


  resources :gossips do
    resources :comments 
    resources :likes
  end

  resources :authors, only: [:show, :new, :create]
  resources :cities, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]
  


end
