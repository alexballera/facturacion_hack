class ChangeColumnSeguridadFromStringToInteger < ActiveRecord::Migration
  def change
  	remove_column :users, :seguridad, :string
  	add_column :users, :permission_level, :integer, default: 1
  end
end
