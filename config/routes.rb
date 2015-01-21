Rails.application.routes.draw do
  resources :products

  get 'welcome/about'

  root to: 'welcome#index'
  
end
