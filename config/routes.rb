Rails.application.routes.draw do
   
  resources :payments
  resources :reservations
  get 'travelagent/index'

  resources :cruises
  resources :cabins
  resources :ships
  resources :credit_cards
  resources :addresses
  resources :customers
  
  root 'travelagent#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
