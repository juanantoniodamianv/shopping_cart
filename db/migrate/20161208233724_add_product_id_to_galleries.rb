class AddProductIdToGalleries < ActiveRecord::Migration[5.0]
  def change
  	    add_reference :galleries, :product, index: true
    add_foreign_key :galleries, :products
  end
end
