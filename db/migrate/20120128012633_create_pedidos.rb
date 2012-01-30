class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :cliente_id
      t.string :numero, :null => false
      t.date :previsao_entrega, :null => false
      t.text :observacao

      t.timestamps
    end
  end
end
