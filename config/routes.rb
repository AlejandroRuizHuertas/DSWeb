Rails.application.routes.draw do
  root "sessions#login"

  resources :users, only: [:new, :create, :destroy]

  post "/" => "sessions#create"
  get "logout" => "sessions#destroy"
  get "users/register" => "users#register"
  post "users/register" => "users#create"
  get "notes/:id/show" => "notes#show", as: :show
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
