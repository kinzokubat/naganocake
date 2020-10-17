Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
