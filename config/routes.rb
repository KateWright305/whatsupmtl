Rails.application.routes.draw do
  resources :activities, only: [:index, :show, :create, :new] do
    post :add_to_groups, on: :member
  end

  resources :groups

  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end

  devise_for :users
  root to: "pages#home"
end
