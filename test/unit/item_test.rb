require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "nao deve salvar sem o preco" do
    item = Item.new
    assert !item.save
  end
end
