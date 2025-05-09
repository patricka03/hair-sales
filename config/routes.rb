Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root to: "hairs#index"
  resources :hairs do
    resources :orders do
      member do
        get :checkout
        get :success
        get :cancel
      end
    end
    resources :reviews, only: [:new, :create, :edit]
  end
  get "/dashboard", to: "pages#dashboard"
  
end
