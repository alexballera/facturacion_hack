class AddCoverToOperations < ActiveRecord::Migration
  def change
  	add_attachment :operations, :cover
  end
end
