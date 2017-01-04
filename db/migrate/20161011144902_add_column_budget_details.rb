class AddColumnBudgetDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :budget_details, :cant, :integer
  	add_column :budget_details, :budget_details_id, :integer
  	add_index :budget_details, :budget_details_id
  end
end
