class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.string :meio, :null => false
      t.float :valor, :null => false
      t.date :data_prevista
      t.string :evento
      t.references :pedido

      t.timestamps
    end
  end
end
