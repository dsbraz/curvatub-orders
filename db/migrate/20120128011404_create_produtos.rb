class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :fabricante, :null => false
      t.string :nome, :null => false

      t.timestamps
    end
  end
end
