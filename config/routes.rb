

Rails.application.routes.draw do

  get 'comments/show'
  get 'comments/edit'
  get 'comments/new'
  get 'comments/index'
  root 'gossips#index'

  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome/:first_name', to: 'static_pages#welcome'
  resources :gossips

  resources :gossips do
    resources :comments 
  end
  resources :authors, only: [:show]
  resources :cities, only: [:show]

end
