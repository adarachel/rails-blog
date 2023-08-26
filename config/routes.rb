Rails.application.routes.draw do
  root 'users#index'
  
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'posts#index'
  get '/users/:id/posts/:post_id', to: 'posts#show'

  resources :users do
    resources :posts do
      resources :comments
      resources :likes, only: [:create, :destroy]
    end
  end
end
