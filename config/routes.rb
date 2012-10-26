BabyBlog::Application.routes.draw do
  resources :connects

  resources :articles

  resources :users

  resources :sessions

  match "signup" => "users#new"
  match "login" => "sessions#new"
  match "signout" => "sessions#destroy"

  match "search" => "articles#index"

  match 'about' => 'footer#about'
  match 'connect' => 'footer#connect'
  post '/footer/create'

  root :to => "articles#index"
end
