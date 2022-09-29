Rails.application.routes.draw do
  root "home#index"
  resources :product, only: %i[index show]
  # Post index
  get "posts", to: "post#index"

  scope module: "user" do
    # User signed_up
    resources :account
    # User Post
    resources :post
  end

  # User Login
  scope module: "user" do
    get "sign_in", to: "session#new", as: "login"
    post "sign_in", to: "session#create"
    delete "sign_in", to: "session#destroy", as: "logout"
  end
  # ResetPassword
  scope module: "user" do
    # User Reset Password
    get "reset_password", to: "reset_password#new"
    post "reset_password", to: "reset_password#create"
    get "reset_password/edit", to: "reset_password#edit"
    patch "reset_password/edit", to: "reset_password#update"
  end

  # dashboard
  namespace :dashboard do
    scope module: "admin" do
      resources :users
      resources :products
    end
  end
end
