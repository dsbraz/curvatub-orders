class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :cliente_id, :null => false
      t.string :numero, :unique => true, :null => false
      t.date :previsao_entrega, :null => false
      t.string :vendedor
      t.text :observacao

      t.timestamps
    end
  end
end
