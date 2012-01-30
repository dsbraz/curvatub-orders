class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.float :preco, :null => false
      t.integer :pedido_id
      t.integer :produto_id
      t.text :observacao

      t.timestamps
    end
  end
end
