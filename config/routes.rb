Rails.application.routes.draw do
 
  resources :products
  resources :stores
  resources :carts
  resources :line_items

  get 'welcome/about'

  root to: 'welcome#index'
  
end
