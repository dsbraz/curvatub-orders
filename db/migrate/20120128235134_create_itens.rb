class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.float :preco, :null => false
      t.references :pedido, :null => false
      t.references :produto, :null => false
      t.text :observacao

      t.timestamps
    end
  end
end
