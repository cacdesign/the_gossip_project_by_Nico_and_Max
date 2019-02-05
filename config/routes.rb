

Rails.application.routes.draw do

  root 'gossips#index'

  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome/:first_name', to: 'static_pages#welcome'
  resources :gossips

  resources :gossips do
  	resources :authors, only: [:show]
  end



end
