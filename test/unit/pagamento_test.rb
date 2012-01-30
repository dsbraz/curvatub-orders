require 'test_helper'

class PagamentoTest < ActiveSupport::TestCase
  test "nao deve salvar sem o meio, o valor" do
    pagamento = Pagamento.new
    assert !pagamento.save
  end

  test "deve ser uma pagamento contra evento se houver um evento associado" do
    pagamento = Pagamento.new(:meio => 'Boleto', :valor => 1.0, :evento => 'Entrega')
    assert pagamento.contra_evento?
  end

  test "nao deve salvar sem data prevista se nao for conta evento" do
    pagamento = Pagamento.new(:meio => 'Boleto', :valor => 1.0)
    assert !pagamento.save
  end
end
