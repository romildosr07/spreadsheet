require "test_helper"

class PartOrServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_or_service = part_or_services(:one)
  end

  test "should get index" do
    get part_or_services_url, as: :json
    assert_response :success
  end

  test "should create part_or_service" do
    assert_difference("PartOrService.count") do
      post part_or_services_url, params: { part_or_service: { name: @part_or_service.name, price: @part_or_service.price, quantity: @part_or_service.quantity, spreadsheet_id: @part_or_service.spreadsheet_id, type: @part_or_service.type } }, as: :json
    end

    assert_response :created
  end

  test "should show part_or_service" do
    get part_or_service_url(@part_or_service), as: :json
    assert_response :success
  end

  test "should update part_or_service" do
    patch part_or_service_url(@part_or_service), params: { part_or_service: { name: @part_or_service.name, price: @part_or_service.price, quantity: @part_or_service.quantity, spreadsheet_id: @part_or_service.spreadsheet_id, type: @part_or_service.type } }, as: :json
    assert_response :success
  end

  test "should destroy part_or_service" do
    assert_difference("PartOrService.count", -1) do
      delete part_or_service_url(@part_or_service), as: :json
    end

    assert_response :no_content
  end
end
