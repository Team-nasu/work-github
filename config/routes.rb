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
    get 'genres/index'
    get 'genres/edit'
    get 'homes/top'
    get 'products/index'
    get 'products/new'
    get 'products/show'
    get 'products/edit'
  end

scope module: :public do
  get 'addresses/index'
  get 'addresses/edit'
  get 'orders/new'
  get 'orders/comfirm'
  get 'orders/complite'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'customers/index'
  root to: 'homes#top'
  get '/about' => 'homes#about'
end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
