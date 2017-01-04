class CreateBudgetDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_details do |t|

      t.timestamps
    end
  end
end
