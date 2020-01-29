Rails.application.routes.draw do

  get 'training_fees/new'

  get 'entertainment_fees/new'

  get 'requests/index'

  get 'parking_fees/new'

  root 'static_pages#home' # => root_path

  get 'sessions/new'

  #get    'organizations/signup',  to: 'organizations#new'
  #post   'organizations/signup',  to: 'organizations#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :organizations do
    member do
      get 'organization_requests_index'
    end
    resources :users do
      resources :requests, only: [:index, :destroy]
      resources :eating_entertainment_fees, except: [:destroy]
      resources :entertainment_fees, except: [:destroy]
      resources :parking_fees, except: [:destroy]
      resources :train_fares, except: [:destroy]
      resources :training_fees, except: [:destroy]
    end
  end
  
end
