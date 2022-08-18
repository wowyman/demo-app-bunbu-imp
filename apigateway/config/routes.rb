Rails.application.routes.draw do
  resources :services
  resources :routes

  root "home#index"
  get "auth" => "home#auth"
  post "account_token" => "account_token#create"
  # Account actions
  get "/accounts" => "accounts#index"
  get "/accounts/current" => "accounts#current"
  post "/accounts/create" => "accounts#create"
  patch "/account/:id" => "accounts#update"
  delete "/account/:id" => "accounts#destroy"

  DynamicRouter.load
end
