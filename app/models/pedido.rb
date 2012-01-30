class Pedido < ActiveRecord::Base
  has_many :itens
  has_many :pagamentos
  validates :cliente_id, :numero, :previsao_entrega, :presence => true
  validates :numero, :uniqueness => true
  validate :soma_pagamentos_igual_valor_total?

  def cliente
    Cliente.find(self.cliente_id)
  end

  def cliente=(c)
    self.cliente_id = c.id
  end

  def valor
    total = 0.0
    if not self.itens.empty?
      self.itens.each do |item|
        total += item.preco
      end
    end
    return total
  end

  def valor_pagamentos
    total = 0.0
    if not self.pagamentos.empty?
      self.pagamentos.each do |pagamento|
        total += pagamento.valor
      end
    end
    return total
  end

  def soma_pagamentos_igual_valor_total?
    if valor != valor_pagamentos
      errors.add(:pagamentos, "A soma dos pagamentos deve ser igual ao valor do pedido")
      return false
    end
    return true
  end
end
