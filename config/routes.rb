Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complite'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/index'
  end
  namespace :public do
    get '/top' => 'homes#top'
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/show'
    get 'products/edit'
  end


  namespace :admin do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
