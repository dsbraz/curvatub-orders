Orders::Application.routes.draw do
  devise_for :users

  resources :pedidos do
    member do
      get 'print'
    end
  end

  resources :produtos

  root :to => 'pedidos#index'
end
