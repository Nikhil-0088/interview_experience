Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :experiences do 
    resource :upvotes,only:[:create,:destroy]
  end
  resources :users
  resources :companies do 
    resource :subscribes,only: [:create,:destroy]
    collection do 
      get 'search'
    end 
  end 
  get 'login',to: "sessions#new"
  post 'login', to:"sessions#create"
  delete 'logout', to:"sessions#destroy"
  get 'aproove',to: "admin#show"
  patch  'aproove', to:"admin#aproove"
  get '/companies/search', to: 'companies#search'
end
