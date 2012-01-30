require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  test "nao deve salvar sem o fabricante e o nome" do
    produto = Produto.new()
    assert !produto.save
  end
end
