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
  resource :profile, only: [:show]
  resources :types
  devise_for :users
  resource :preferences, only: [:edit, :update]
  root to: "pages#home"
end
