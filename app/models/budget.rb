class Budget < ApplicationRecord
	has_many :budget_details, autosave: true, dependent: :destroy
	has_many :products, through: :budget_details

	
end
