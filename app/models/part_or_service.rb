class PartOrService < ApplicationRecord
  self.table_name = "parts_or_services"
  belongs_to :spreadsheet_table
end
