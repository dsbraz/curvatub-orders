Orders::Application.routes.draw do
  resources :pedidos do
    member do
      get 'print'
    end
  end

  resources :produtos
end
