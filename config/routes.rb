Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }

  root to: 'items#index'
  resources :items do
    resource :order_lists, only: [:index, :create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :chats, only: [:index, :create, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
  end  
end
