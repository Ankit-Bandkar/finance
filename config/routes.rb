Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  get '/test', to: 'users#test'
  get 'static_pages/home'
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  root 'static_pages#home'
  resources :users, only: [:edit, :update, :show, :index]

  resources :incomes
  resources :expenses

  resources :organizations, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
