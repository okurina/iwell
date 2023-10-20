Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }

  root to: 'items#index'
  resources :items do
    resources :order_lists, only: [:index, :create]
    collection do
      get :search
    end
  end
  resources :order_lists, only: :destroy do
    member do
      delete :remove_from_list
    end
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :chats, only: [:index, :create, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
  end  
end
