Rails.application.routes.draw do

  resources :posts, only: [:index, :show]
  get '/', to: 'home#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'users#posts'
  get '/users/:user_id/posts/:post_id', to: 'users#post'
  post '/users/:user_id/posts', to: 'posts#create', as: :create_post
  delete '/posts/:id', to: 'posts#destroy', as: :delete_post
end
