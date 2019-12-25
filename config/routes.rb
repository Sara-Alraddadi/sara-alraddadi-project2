Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy', as: 'destroy_user_session_via_get'
  end

  root to: 'pages#index'
  get "pages", to: "pages#index"
  get "games", to: "games#gameindex"
  get "games/new", to: "games#new"
  get "pages/mygame", to: "pages#mygame"
  
  


  post "games", to: "games#create"

  # root to: 'games#gameindex'
  resources :artists, :songs

  get "games/:id/edit", to: "games#edit", as: :game_edit

  patch "games/:id", to: "games#update"
  delete "games/:id", to: "games#destroy"

  get "games/:id", to: "games#show", as: :game
  get "reviews", to: "reviews#index"

  get "reviews/new", to: "reviews#new"
  post "reviews", to: "reviews#create"

  
end
