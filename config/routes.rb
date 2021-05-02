Rails.application.routes.draw do
  root "sessions#login"
  
  resources :notes do
    member do
      delete :delete_image_attachment
    end
  end

  post "/" => "sessions#create"
  get "logout" => "sessions#destroy"
  get "users/register" => "users#new"
  post "users/register" => "users#create"
  get "notes/:id/show" => "notes#show", as: :show
  get "notes/new" => "notes#register"
  post "notes/new" => "notes#create"
  get "admin/management" => "admin#management"

  resources :users
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
