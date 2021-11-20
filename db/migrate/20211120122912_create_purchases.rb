class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :drink_id
      t.integer :user_id
      t.float :total
    end 
  end
end
