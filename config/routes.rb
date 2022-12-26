Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:show, :update]
    get 'homes/top'
  end

  scope module: :public do

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get 'orders/complite' => "orders#complite"
    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => "orders#confirm"
    get "customers/information/edit" => "customers#edit"
    get "customers" => "customers#show"
    patch "customers/information" => "customers#update"
    get "customers/check" => "customers#check"
    patch "customers/withdraw" => "customers#withdraw"
    resources :products, only: [:index, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
