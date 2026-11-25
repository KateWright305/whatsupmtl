Rails.application.routes.draw do
  resources :activities, only: [:index, :show, :create, :new, :destroy] do
    get :add_to_groups, on: :member
    post :save_groups, on: :member
    delete :remove_group, on: :member
  end
  resources :groups
  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end
  resources :types
  devise_for :users
  root to: "pages#home"
end
