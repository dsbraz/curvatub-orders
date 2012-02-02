class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.string :meio, :null => false
      t.float :valor, :null => false
      t.date :data_prevista, :null => false
      t.string :evento
      t.references :pedido, :null => false

      t.timestamps
    end
  end
end
