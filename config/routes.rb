Rails.application.routes.draw do
  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
get '/admin' => 'admin/homes#top'

namespace :admin do
  resources :items, only: [:index, :create, :new, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  resources :contacts
end

  get '/admins/sgin_in' => 'admin/session#new'

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  resources :items, only: [:index, :show]
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  resources :cart_items, only: [:index, :create, :destroy, :update]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  post "/orders/confirm" => "orders#confirm"
  get "/orders/complete" => "orders#complete"
  resources :orders, only: [:index, :show, :new, :create]
  resources :perfumes, only: [:index, :new, :show, :create]
  resources :contacts, only: [:new, :index, :create]
  get "search" => "searches#search"
end
  get '/customers/sign_in' => 'public/session#new'
  get '/customers/mypage' => 'public/customers#show'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/confirm_withdraw' => 'public/customers#check'
  patch '/customers/withdraw' => 'public/customers#withdrawal'
  get '/orders' => 'public/orders#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end