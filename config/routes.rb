Rails.application.routes.draw do
  root to: 'home#index'

  resources :movies, only: [:index, :show, :new, :create, :edit, :update] do
    patch :publish, on: :member
    patch :unpublish, on: :member
    delete :destroy, on: :member
  end
  resources :directors, only: [:index, :show, :new, :create, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
end
