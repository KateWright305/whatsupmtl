Rails.application.routes.draw do
  resources :activities, only: [:index, :show]
  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end
  devise_for :users
  root to: "pages#home"
end
