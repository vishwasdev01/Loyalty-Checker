Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :transactions, only: [:index, :create]
    resources :rewards, only: [:index, :create]
  end

  resources :transactions, only: [:show, :update, :destroy]

  resources :rewards, only: [:show, :update, :destroy]
end
