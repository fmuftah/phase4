Rails.application.routes.draw do
  resources :users
  resources :store_flavors
  resources :flavors
  resources :jobs
  resources :shift_jobs
  resources :shifts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :stores
  resources :employees
  resources :assignments
  resources :demos, only: [:new, :create, :destroy]
  get 'login', to: 'demos#new', as: :login
  get 'logout', to: 'demos#destroy', as: :logout
  # need routes for authors and categories ...
  
  
  # Set the root url
  root to: 'home#home', as: :home
  get 'active', to: 'stores#active', as: :active_stores
  get 'inactive', to: 'stores#inactive', as: :inactive_stores
  get "active_employees", to: "employees#active_employees", as: :active_employees
  get "inactive_employees", to: "employees#inactive_employees", as: :inactive_employees
  get "younger", to: "employees#younger_than_18", as: :younger_than_18
  get "older", to: "employees#is_18_or_older", as: :is_18_or_older
  get "regulars", to: "employees#regulars", as: :regulars
  get "managers", to: "employees#managers", as: :managers
  get "admins", to: "employees#admins", as: :admins
  get 'current', to: 'assignments#current', as: :current
  get 'past', to: 'assignments#past', as: :past
  get "by_employee", to:"assignments#by_employee", as: :by_employee
  get "chronological", to:"assignments#chronological", as: :chronological
  get "for_store", to:"assignments#for_store", as: :for_store
  get "for_employee", to:"assignments#for_employee", as: :for_employee
  get "for_pay_level", to:"assignments#for_pay_level", as: :for_pay_level
  get "for_role", to:"assignments#for_role", as: :for_role

end
