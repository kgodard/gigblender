Gigblender::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"} , path: 'accounts'

  # resources :users
  resources :artists

  # authenticated :user do
  #   root :to => 'home#index'
  # end
  root :to => "home#index"
end
