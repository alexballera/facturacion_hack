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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150711023040) do

  create_table "clients", force: :cascade do |t|
    t.string   "nombre",         limit: 15
    t.string   "apellido",       limit: 15
    t.string   "identificacion", limit: 15
    t.string   "email",          limit: 30
    t.string   "telefono",       limit: 15
    t.string   "direccion",      limit: 150
    t.string   "descripcion",    limit: 150
    t.integer  "tipo",                       default: 0
    t.integer  "frecuencia",                 default: 0
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "operations", force: :cascade do |t|
    t.integer  "operacion",                                             default: 0
    t.integer  "pago",                                                  default: 0
    t.integer  "factura",                                               default: 0
    t.integer  "cantidad",           limit: 4,                          default: 1,            null: false
    t.decimal  "subtotal",                     precision: 10, scale: 2
    t.decimal  "impuestos",                    precision: 10, scale: 2
    t.decimal  "total",                        precision: 10, scale: 2
    t.decimal  "tasa",                         precision: 4,  scale: 2, default: 12.0
    t.decimal  "balance",                      precision: 10, scale: 2
    t.date     "fecha",                                                 default: '2015-07-11'
    t.string   "comprobante"
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "product_id"
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "state",                                                 default: "in_draft"
  end

  add_index "operations", ["client_id"], name: "index_operations_on_client_id"
  add_index "operations", ["product_id"], name: "index_operations_on_product_id"
  add_index "operations", ["user_id"], name: "index_operations_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "producto",    limit: 30,                          null: false
    t.string   "descripcion", limit: 150
    t.decimal  "precio",                  precision: 8, scale: 2, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "user_id"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 30, default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               limit: 12
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "permission_level",                  default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
