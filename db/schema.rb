# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120129012740) do

  create_table "itens", :force => true do |t|
    t.float    "preco",      :null => false
    t.integer  "pedido_id",  :null => false
    t.integer  "produto_id", :null => false
    t.text     "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagamentos", :force => true do |t|
    t.string   "meio",          :null => false
    t.float    "valor",         :null => false
    t.date     "data_prevista", :null => false
    t.string   "evento"
    t.integer  "pedido_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", :force => true do |t|
    t.integer  "cliente_id",       :null => false
    t.string   "numero",           :null => false
    t.date     "previsao_entrega", :null => false
    t.text     "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.string   "fabricante", :null => false
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
