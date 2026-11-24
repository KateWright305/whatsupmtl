Rails.application.routes.draw do
  resources :activities, only: [:index, :show, :create, :new]
  resources :types
  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end
  resource :profile, only: [:show]
  devise_for :users
  resource :preferences, only: [:edit, :update]
  root to: "pages#home"
end
