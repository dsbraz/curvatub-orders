class Pagamento < ActiveRecord::Base
  belongs_to :pedido
  validates :meio, :valor, :presence => true
  validates :data_prevista, :presence => true, :unless => "contra_evento?"

  def contra_evento?
    !self.evento.nil?
  end
end
