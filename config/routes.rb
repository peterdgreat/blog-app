Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'
  root 'users#index'
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
