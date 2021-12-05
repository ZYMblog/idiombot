Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#new"
  resources :users
  resources :sessions
  delete '/logout', to: "sessions#destroy"
  get 'chats',to:"chats#index"
  get 'register',to:"users#new"


  resources :chats, only: [:show]
  resources :messages, only: [:create]

end
