Orders::Application.routes.draw do
  resources :pedidos do
  	resources :itens
  end

  resources :produtos
end
