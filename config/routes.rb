Rails.application.routes.draw do
  namespace :api do
    get "/posts" => "posts#index"
    get "/posts/:id" => "posts#show"
    post "/posts/" => "posts#create"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#delete"

    get "/tags" => "tags#index"
    get "/tags/:id" => "tags#show"
    post "/tags/" => "tags#create"
    patch "/tags/:id" => "tags#update"
    delete "/tags/:id" => "tags#delete"
  end
end
