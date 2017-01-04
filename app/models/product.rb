require 'carrierwave/orm/activerecord'
class Product < ApplicationRecord
	belongs_to :category
	 validates_associated :category
	has_many :budget_details
	 has_many :galleries
	 accepts_nested_attributes_for :galleries,  allow_destroy: true
	
	validates :name,  presence: { message: "Campo obligatorio" }
	validates :description,  presence: { message: "Campo obligatorio" }
	#validates :quantity, numericality: { only_integer: true }
	validates :quantity, presence: false
	#validates :quantity, numericality:{only_integer: true, greater_than: 0, :message => "El valor ingresado tiene que ser mayor a cero"}
	validates :price, presence: { message: "Campo obligatorio" }
	validates :price, numericality:{only_integer:false,  greater_than: 0, :message => "No se permite un precio vacio o negativo"}
	mount_uploader :photo, ImageUploader 

end

