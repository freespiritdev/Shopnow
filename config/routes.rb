Rails.application.routes.draw do
 
  resources :products
  resources :carts
  resources :line_items

  get 'stores/index'

  root to: 'stores#index', as: 'stores'
  
end
