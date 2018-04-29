Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  resources :articulos
  
  get 'registro', to: 'usuarios#new'
  resources :usuarios, except: [:new]
end
