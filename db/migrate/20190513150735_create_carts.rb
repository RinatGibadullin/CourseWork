class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :product
      t.string :references
      t.string :user
      t.string :references

      t.timestamps
    end
  end
end
