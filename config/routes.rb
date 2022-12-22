Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    resources :customers, only: [:index, :show, :edit]
    resources :products, only: [:index, :new, :show, :edit, :create]
    resources :genres, only: [:index, :edit]
    get 'homes/top'
    get 'orders/show'
  end

  scope module: :public do
    resources :addresses, only: [:index, :edit]
    resources :orders, only: [:new, :complite, :index, :show]
    post 'orders/confirm' => "orders#confirm"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
