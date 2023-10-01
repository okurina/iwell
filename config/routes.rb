Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }

  root to: 'items#index'
  resources :items, only: :index
  resources :users, only: [:index, :show, :edit, :update, :destroy]

end
