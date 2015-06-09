Rails.application.routes.draw do
  
  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  resources :topics
  post :incoming, to: 'incoming#create'  
  devise_for :users
  resources :users, only: [:show]

  
  get 'about' => "welcome#about"
  root to: "welcome#index"
end
