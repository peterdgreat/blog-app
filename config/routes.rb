Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  
  root 'users#index'
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
