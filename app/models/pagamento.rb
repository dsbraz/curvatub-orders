class Pagamento < ActiveRecord::Base
  belongs_to :pedido
  validates :meio, :data_prevista, :valor, :presence => true
end
