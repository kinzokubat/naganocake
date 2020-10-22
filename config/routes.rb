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
  resources :admins
  resources :costomers

  get 'admins/:id/top' => 'admins#top', as: :admins_top
  get 'costomers/:id/top' => 'costomers#top', as: :costomers_top
  get 'admin/costomers' => 'costomers#index', as: :admin_costomers_index
  get 'admin/costomers/:id' => 'costomers#show', as: :admin_costomers_show
  get 'admin/costomers/:id/edit' => 'costomers#edit', as: :admin_costomers_edit

  # 管理者のネームスペース
  # 管理者しかいけないURL
  namespace :admin do
    resources :items
    resources :genres
  end

  # 会員のモジュール
  # 会員しかいけないURL
  scope module: :public do
    resources :items
    get "/item/top", :to => "items#top"
    get "/item/about", :to => "items#about"


    resources :addresses


    resources :cart_items # カート機能

  end

end
