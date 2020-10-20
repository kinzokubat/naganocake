Rails.application.routes.draw do
  resources :genres, only: [:index, :create, :edit, :update]
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 商品のルーティング
  resources :items

  # 会員の一覧ページのルーティング
  get "costomer_index" => "items#costomer_index"
  get "costomer_top" => "items#costomer_top"
  get "costomer_about" => "items#costomer_about"
end
