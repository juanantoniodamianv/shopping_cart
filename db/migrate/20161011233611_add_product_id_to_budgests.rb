class AddProductIdToBudgests < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :product_id, :integer
    add_foreign_key :budgets, :products
  end
end
