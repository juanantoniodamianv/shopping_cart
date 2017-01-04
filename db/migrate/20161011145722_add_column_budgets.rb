class AddColumnBudgets < ActiveRecord::Migration[5.0]
  def change
  	add_column :budgets, :budget_id, :integer
  	add_index :budgets, :budget_id
  end
end
