class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.text :descripcion
      t.decimal :precio

      t.timestamps null: false
    end
  end
end
