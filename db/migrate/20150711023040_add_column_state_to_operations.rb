class AddColumnStateToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :state, :string, default: "Borrador"
  end
end
