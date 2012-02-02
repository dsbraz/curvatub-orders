require 'test_helper'

class PagamentoTest < ActiveSupport::TestCase
  test "nao deve salvar sem o meio, a data prevista e o valor" do
    pagamento = Pagamento.new
    assert !pagamento.save
  end
end
