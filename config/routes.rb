Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'books/show'
  get 'books/index'
  #devise_for :users,controllers: {
  #  sessions: 'devise/sessions',
   # registrations: 'devise/registrations'
  #}
  root to: 'homes#top'
  get 'homes/about'
  #resources :users
  #resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end