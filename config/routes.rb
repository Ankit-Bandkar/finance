Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  root 'static_pages#home'
  resources :users, only: [:edit, :update, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
