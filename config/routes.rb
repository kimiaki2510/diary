Rails.application.routes.draw do
  root to: 'records#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :followings
      get :followers
    end
  end
  post "likes/:record_id/create", to: "likes#create", constraints: {record_id: /\d+/}, as: :likes_create
  post "likes/:record_id/delete", to: "likes#delete", constraints: {record_id: /\d+/}, as: :likes_delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :records, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
end
