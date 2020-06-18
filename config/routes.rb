Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :account do
    resources :posts
  end

end
