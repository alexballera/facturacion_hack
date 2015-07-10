Rails.application.routes.draw do
  root 'welcome#index' 
	
  devise_for :users
  resources :clients 
  resources :operations
  resources :products
  # resources :clients do
  # 	resources :operations
  # end
end
