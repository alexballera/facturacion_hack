class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.integer :operacion, default: 0
      t.integer :pago, default: 0
      t.integer :cantidad, limit: 4, null: false, default: 1
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :impuestos, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.decimal :tasa, precision: 4, scale: 2, default: 12
      t.decimal :balance, precision: 10, scale: 2
      t.date :fecha, default: Time.now
      t.string :comprobante
      t.references :user, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
