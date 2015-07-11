class AddColumnStateToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :state, :string, default: "in_draft"
  end
end
