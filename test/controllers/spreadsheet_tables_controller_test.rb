require "test_helper"

class SpreadsheetTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spreadsheet_table = spreadsheet_tables(:one)
  end

  test "should get index" do
    get spreadsheet_tables_url, as: :json
    assert_response :success
  end

  test "should create spreadsheet_table" do
    assert_difference("SpreadsheetTable.count") do
      post spreadsheet_tables_url, params: { spreadsheet_table: { kms: @spreadsheet_table.kms, license_plate: @spreadsheet_table.license_plate, name: @spreadsheet_table.name, phone: @spreadsheet_table.phone, vehicle: @spreadsheet_table.vehicle } }, as: :json
    end

    assert_response :created
  end

  test "should show spreadsheet_table" do
    get spreadsheet_table_url(@spreadsheet_table), as: :json
    assert_response :success
  end

  test "should update spreadsheet_table" do
    patch spreadsheet_table_url(@spreadsheet_table), params: { spreadsheet_table: { kms: @spreadsheet_table.kms, license_plate: @spreadsheet_table.license_plate, name: @spreadsheet_table.name, phone: @spreadsheet_table.phone, vehicle: @spreadsheet_table.vehicle } }, as: :json
    assert_response :success
  end

  test "should destroy spreadsheet_table" do
    assert_difference("SpreadsheetTable.count", -1) do
      delete spreadsheet_table_url(@spreadsheet_table), as: :json
    end

    assert_response :no_content
  end
end
