class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.float :preco, :null => false
      t.references :pedido
      t.references :produto
      t.text :observacao

      t.timestamps
    end
  end
end
