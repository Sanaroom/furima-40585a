Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  get '/ladies', to: 'items#ladies'
  get '/mens', to: 'items#mens'
  get '/baby', to: 'items#baby'

  get '/ordered', to: 'users#ordered'
  
  

  
  
  resources :items do
    resources :orders , only: [:index,:create]
    resources :comments, only: [:create] 
    collection do
      get 'search'
    end
  end

  resources :users, only: [:index,:show] 
   


end
