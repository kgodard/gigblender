Gigblender::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"} , path: 'accounts'

  # resources :users
  resources :artists

  resources :users do
    resources :artists
  end

  get 'zipcode/autocomplete_zipcode_zipcode'

  # authenticated :user do
  #   root :to => 'home#index'
  # end
  root :to => "home#index"
end
