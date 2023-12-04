Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }

  root to: 'items#index'
  resources :items do
    resources :order_lists, only: [:index, :create, :destroy] do
      member do
        delete :remove_from_list
      end
    end
    member do
      get 'print_qr_code'
    end
    collection do
      get :search
    end
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :chats, only: [:index, :create, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
  end  
end
