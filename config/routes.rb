BabyBlog::Application.routes.draw do
  devise_for :users

  resources :connects

  resources :articles

  resources :users

  match "search" => "articles#index"

  match 'about' => 'footer#about'
  match 'connect' => 'footer#connect'
  post '/footer/create'

  root :to => "articles#index"
end
