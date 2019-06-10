Rails.application.routes.draw do
	resources :ordered_products
  resources :products
  resources :orders
  devise_for :users, :controllers => { registrations: 'registrations'}
  root 'products#index', as: 'home'
  get '/profile', to: 'users#profile'

  # get '/newCart', to: 'carts#show', as 'newCart'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
