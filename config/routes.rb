Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :events do
    resources :charges
    resources :attendances, only: %i[index create]
    resources :pictures, only: %i[show]
  end # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
