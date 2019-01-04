Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  mount ActionCable.server, at: '/cable'
end
