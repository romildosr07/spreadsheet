class RenameTypeColumnInPartsOrServices < ActiveRecord::Migration[7.1]
  def change
    rename_column :parts_or_services, :type, :category
  end
end
