Rails.application.routes.draw do
  root "main#index"
  get "cities/view", to: "cities#view"
  get "cities/new", to: "cities#new"
  post "cities/new", to: "cities#new"
  post "cities/create", to: "cities#create"
  get "cities/update", to: "cities#update"
  post "cities/update", to: "cities#update"
  post "cities/update_handle", to: "cities#update_post"
  post "cities/delete", to: "cities#delete"
  # I manually change the routes structure in the instructions to achieve the effect
  # of super_link <a></a>, which has to use 'post' method instead of 'get' ones
end
