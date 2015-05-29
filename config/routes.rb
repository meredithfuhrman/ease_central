Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts
  resources :favorites

  match "favorites/:post_id" => "favorites#create", :as => :favorite


end
