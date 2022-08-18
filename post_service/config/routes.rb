Rails.application.routes.draw do
  get "/api/v1/posts", to: "post#index"
  resources :post
end
