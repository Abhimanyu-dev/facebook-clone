Rails.application.routes.draw do
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :friend_requests do
    member do
      post :accept
    end
  end
  resources :homepages, only: [:index]
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, only: [:show]

  get "/friends", to: "homepages#friend_page"
  get "/index", to: "homepages#index"
  get "/shop", to: "homepages#shop"
  get "/game", to: "homepages#game"
  get "/watch", to: "homepages#watch"
  get "/search", to: "homepages#search"


  root "homepages#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
