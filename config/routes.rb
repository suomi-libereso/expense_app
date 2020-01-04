Rails.application.routes.draw do

  get    'organizations/signup',  to: 'organizations#new'
  post   'organizations/signup',  to: 'organizations#create'
  get    'users/signup',  to: 'users#new'
  post   'users/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  
end
