class CreateTill < ActiveRecord::Migration[6.1]
  def change
    create_table :tills do |t|
      t.float "value"
      t.integer "quantity"
    end
  end
end
