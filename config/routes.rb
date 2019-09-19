Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
  end  
    
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete "posts/:id/destroy" => "posts#destroy"
  root to: 'posts#index'
  resources :users
  resources :posts
end