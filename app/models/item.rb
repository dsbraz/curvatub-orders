class Item < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto
  validates :preco, :presence => true
end
