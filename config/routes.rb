

Rails.application.routes.draw do
#  get 'authors/show'
  get 'gossips/team'
  get 'gossips/contact'
 # get 'welcome/:first_name', to: 'gossip#welcome'
 # get 'gossip/:id', to: 'gossip#detail',  as: "gossip"
 # get 'gossip/author/:id', to: 'gossip#author', as: "gossip_author"
  root 'gossips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips

  resources :gossips do
    resources :authors
  end
end
