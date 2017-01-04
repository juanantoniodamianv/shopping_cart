class RemoveProductIdToBudgests < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :budgets, :products
    remove_column :budgets, :product_id
    add_column :budget_details, :product_id, :integer
    add_foreign_key :budget_details, :products

  end
end
