Rails.application.routes.draw do
  resources :products
  resources :stores

  get 'welcome/about'

  root to: 'welcome#index'
  
end
