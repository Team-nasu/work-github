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
    resources :products, only: [:index, :new, :show, :edit]
    resources :genres, only: [:index, :edit]
    get 'homes/top'
    get 'orders/show'
  end

  scope module: :public do
    resources :addresses, only: [:index, :edit]
    resources :orders, only: [:new, :confirm, :complite, :index, :show]
    resources :customers, only: [:index, :show, :edit]
    resources :products, only: [:index, :show]
    get 'cart_items/index'
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
