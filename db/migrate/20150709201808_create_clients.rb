class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre, limit: 15
      t.string :apellido, limit: 15
      t.string :identificacion, limit: 15
      t.string :email, limit: 30
      t.string :telefono, limit: 15
      t.string :direccion, limit: 150
      t.string :descripcion, limit: 150
      t.integer :tipo, default: 0
      t.integer :frecuencia, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
