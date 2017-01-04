class AddImageCheckToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :image_check, :boolean, :default => false
  end
end
