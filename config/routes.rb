Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'


  
  
  

  
  
  resources :items do
    resources :orders , only: [:index,:create]
    resources :comments, only: [:create] 
    collection do
      get 'search'
    end
    member do
      post 'favorite'
      delete 'unfavorite'
    end
  end

  resources :users, only: [:show] do
    collection do
      get :favorites
    end
  end
  
   


end
