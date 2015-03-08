Rails.application.routes.draw do
  devise_for :users
  get 'orders/index'

  resources :products
  resources :carts
  resources :line_items
  resources :orders
  
 

  get 'stores/index'

  root to: 'stores#index', as: 'stores'
  
end
