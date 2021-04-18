Rails.application.routes.draw do
  root "sessions#login"

  resources :users, only: [:new, :create, :destroy]
  resources :notes

  post "/" => "sessions#create"
  get "logout" => "sessions#destroy"
  get "users/register" => "users#register"
  post "users/register" => "users#create"
  get "notes/:id/show" => "notes#show", as: :show
  get "notes/new" => "notes#register"
  post "notes/new" => "notes#create"
  get "admin/management" => "admin#management"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
