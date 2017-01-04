# require 'carrierwave/orm/activerecord'
class Gallery < ApplicationRecord
	 belongs_to :product,  optional: true
	 mount_uploader :photo, PhotoUploader
	 validates :photo,  presence: { message: "Campo obligatorio" }
	
end

