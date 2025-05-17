class CreatePartsOrServices < ActiveRecord::Migration[7.1]
  def change
    create_table :parts_or_services do |t|
      t.string :type
      t.integer :quantity
      t.string :name
      t.decimal :price
      t.references :spreadsheet_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
