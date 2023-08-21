Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'users#posts'
  get '/users/:user_id/posts/:post_id', to: 'users#post'
end