class AddBudgetIdToBudgetDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :budget_details, :budget_id, :integer
    add_foreign_key :budget_details, :budgets
  end
end
