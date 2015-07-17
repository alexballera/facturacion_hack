class RemoveColumnDescripcionFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :descripcion, :string, limit: 150    
  end
end
