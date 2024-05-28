Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :experiences
  resources :users
  get 'login',to: "sessions#new"
  post 'login', to:"sessions#create"
  delete 'logout', to:"sessions#destroy"
  get 'aproove',to: "admin#show"
  patch  'aproove', to:"admin#aproove"
end
