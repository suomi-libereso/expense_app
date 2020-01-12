Rails.application.routes.draw do

  root 'static_pages#home' # => root_path

  get 'sessions/new'

  #get    'organizations/signup',  to: 'organizations#new'
  #post   'organizations/signup',  to: 'organizations#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :organizations do
    resources :users
  end
  
end
