class RemoveValueColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :drinks, :value
  end
end
