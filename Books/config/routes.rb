Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :index, :show, :edit, :update]


  resources :books, only: [:new, :edit, :show, :index, :update, :destroy, :create]


  root "users#top"


end
