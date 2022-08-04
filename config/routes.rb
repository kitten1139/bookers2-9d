Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  devise_for :users

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  get :followers, on: :member
  get :follows, on: :member
  end

  get 'chats/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :groups do
    get 'join' => 'groups#join'
  end

  get "search_book" => "books#search_book"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
