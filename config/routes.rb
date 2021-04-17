Rails.application.routes.draw do
  root "notes#index"
  get 'notes/login' => 'notes#login'
  get 'notes/register' => 'notes#register'
  get 'notes/:id/show' => 'notes#show', as: :show
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
