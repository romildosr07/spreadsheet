class CreateSpreadsheetTables < ActiveRecord::Migration[7.1]
  def change
    create_table :spreadsheet_tables do |t|
      t.string :name
      t.string :phone
      t.string :vehicle
      t.string :license_plate
      t.integer :kms

      t.timestamps
    end
  end
end
