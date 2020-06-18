Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  post 'upload' => "photos#upload"

  namespace :account do
    resources :posts
  end



end
