Rails.application.routes.draw do

  scope module: :public do
    devise_for :customers
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customer, only: [:show, :edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm' => 'orders#confirm'
    get '/thanks' => 'orders#thanks'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


  scope module: :admin do
    devise_for :admins, only: [:session, :password]
  end

  namespace :admin do
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    get '' => 'homes#top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
