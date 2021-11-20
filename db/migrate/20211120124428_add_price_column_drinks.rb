class AddPriceColumnDrinks < ActiveRecord::Migration[6.1]
  def change
    add_column :drinks, :price, :float
  end
end
