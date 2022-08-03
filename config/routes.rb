# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  resource :session, controller: 'sessions', only:  %i[create]

  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  delete '/sign_out', to: 'sessions#destroy'

  resources :passwords, controller: "passwords", only: [:create, :new]

  resources :users do
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  namespace :admin do
    root to: "home#index"
    resources :home, only: :index
    resources :categories
    resources :works
    resources :faqs
  end
end
