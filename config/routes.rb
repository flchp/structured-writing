Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  post 'upload' => "photos#upload"

  namespace :account do
    resources :posts do
      member do
        post :set_as_private
        post :quit_set_as_private
        post :set_as_model
        post :quit_set_as_model
      end
      collection do
        get :select_model_new
      end
    end
  end



end
