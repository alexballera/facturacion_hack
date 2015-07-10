class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :producto, null: false, limit: 30
      t.string :descripcion, limit: 150
      t.decimal :precio, precision: 8, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
