Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  
  root 'users#index'
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
    
  end
end
