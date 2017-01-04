class ModdificColum2 < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :Users, :admin, false
  end
end
