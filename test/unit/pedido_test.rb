require 'test_helper'

class PedidoTest < ActiveSupport::TestCase
  test "nao deve salvar sem o numero e a previsao de entrega" do
    pedido = Pedido.new
    assert !pedido.save
  end

  test "nao deve salvar dois pedidos com o mesmo numero" do
    pedido = Pedido.new(:numero => 123, :previsao_entrega => '2012-02-28')
    assert !pedido.save
  end

  test "nao deve salvar se soma dos pagamentos for diferente do preco" do
    pedido = Pedido.find(980190962)
    pedido.pagamentos << Pagamento.new(:meio => 'Deposito', :valor => 1.00)
    assert !pedido.save
  end

  test "deve retornar o cliente remoto" do
    cliente = Cliente.find(980190962)
    pedido = Pedido.find(980190962)
    assert pedido.cliente == cliente
  end

  test "deve calcular o valor total" do
    pedido = Pedido.find(980190962)
    assert pedido.valor == 70000.00
  end

  test "deve calcular o valor total dos pagamentos" do
    pedido = Pedido.find(980190962)
    assert pedido.valor_pagamentos == 70000.00
  end

end
