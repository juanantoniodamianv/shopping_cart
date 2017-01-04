class Category < ApplicationRecord
	has_many :products
	validates :name,  presence:  { message: "Campo obligatorio" }
end
