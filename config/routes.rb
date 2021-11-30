Rails.application.routes.draw do

  scope module: :public do
    devise_for :customers
    
  end

  scope module: :admin do
    devise_for :admins
  end

  namespace :admin do
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get '' => 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
