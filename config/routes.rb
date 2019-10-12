Rails.application.routes.draw do
  root to: 'records#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :records, only: [:index, :show, :new, :create, :edit, :update, :destroy]
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
