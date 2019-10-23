Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
  end  
    
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete "posts/:id/destroy" => "posts#destroy"
  delete "/admin/users/:id/destroy" => "users#destroy"
  root to: 'posts#index'
  resources :users
  resources :posts

  get "/terms", to: "rules#terms"
  get "/privacy", to: "rules#privacy"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :sessions, only: %i(new create destroy)
  resources :home, only: %i(index)

end