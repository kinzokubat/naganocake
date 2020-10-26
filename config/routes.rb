Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :costomers, controllers: {
  sessions:      'costomers/sessions',
  passwords:     'costomers/passwords',
  registrations: 'costomers/registrations'
}

  # 管理者のネームスペース
  # 管理者しかいけないURL
  namespace :admin do
    resources :items
    resources :genres
    resources :costomers
    get "/top", :to => "costomers#top"
    resources :orders
  end

  # 会員のモジュール
  # 会員しかいけないURL
  scope module: :public do
    resources :items
    root  :to => "items#top"
    get "/item/about", :to => "items#about"
    resources :addresses # アドレス機能
    resources :cart_items # カート機能
    # <!--追加分-->
    patch "/cart_items", :to => 'cart_items#update_all'
    # <!--追加分-->
    delete "/cart_items", :to => "cart_items#destroy_all", as: "cart_items_destroy_all"
    resources :costomers
    get "/unsubscribe", :to => "costomers#unsubscribe"
    get "/withdraw", :to => "costomers#withdraw"
    resources :orders
    post "/order/comfirm", :to => "orders#comfirm"
    get "/order/complete", :to => "orders#complete"
  end

end
