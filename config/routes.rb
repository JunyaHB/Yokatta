Rails.application.routes.draw do
  
  get 'oauth/new'
  get 'oauth/create'
  get 'oauth/destroy'

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


  
  get 'auth/:provider/callback', to: 'oauth#create'
  get 'auth/failure', to: redirect('/')
  
  get "users/:id/likes" => "users#likes"
  get "users/:id/show_false" => "users#show_false"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :oauth, only: %i(new create destroy)
  resources :home, only: %i(index)
  resources :relationships, only: [:create, :destroy]
end