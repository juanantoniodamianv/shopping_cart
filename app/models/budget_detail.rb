class BudgetDetail < ApplicationRecord
	# belongs_to :budget_detail
	belongs_to :product
	validates :product, presence: true
end
