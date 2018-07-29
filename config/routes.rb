Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  resources :articulos
  
  get 'registro', to: 'usuarios#new'
  resources :usuarios, except: [:new]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  resources :categorias
  resources :password_resets
  resources :sessions
  
end
