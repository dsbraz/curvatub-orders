class Produto < ActiveRecord::Base
  has_many :itens
  validates :fabricante, :nome, :presence => true
end
