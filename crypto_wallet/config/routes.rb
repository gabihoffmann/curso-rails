Rails.application.routes.draw do
  get 'welcome/index'
  # resources cria 7 rotas padrao usando REST para o CRUD
  resources :coins
  
  #alterando rota padrao
  root 'welcome#index'
  #criando rotas 
  get '/ola', to: 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
