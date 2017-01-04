class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
