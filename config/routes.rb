Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'records#index'

  get 'signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
resources :records, only: [:show, :new, :create, :edit, :update, :destroy]
end
