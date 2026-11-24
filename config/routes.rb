Rails.application.routes.draw do
  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end
  resources :activities, only: [:index, :show, :create, :new]
  devise_for :users
  root to: "pages#home"
end
