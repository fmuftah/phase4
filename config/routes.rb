Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :stores
  resources :employees
  resources :assignments
  
  # need routes for authors and categories ...
  
  
  # Set the root url
  root to: 'stores#index', as: :home
end
