Rails.application.routes.draw do
  get 'gossip/team'
  get 'gossip/contact'
  get 'welcome/:first_name', to: 'gossip#welcome'
  get 'gossip/:id', to: 'gossip#detail'
  get 'gossip/author/:id', to: 'gossip#author', as: "gossip_author"
  root 'gossip#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
