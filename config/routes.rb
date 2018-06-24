Rails.application.routes.draw do
 
 devise_for :users, :controllers => {
    :registrations => "registrations"
  }
  
  resources :users, only: [:show, :index, :destroy] do
    member do
      get :following, :followers
    end
   end
  resources :users, only: [:show, :index,:destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  root  'static_pages#home' 
  
  get 'users/show'
 
  get '/help',to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact',to: 'static_pages#contact'

end