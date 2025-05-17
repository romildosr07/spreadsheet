class SpreadsheetTablesController < ApplicationController
  before_action :set_spreadsheet_table, only: %i[ show update destroy ]

  # GET /spreadsheet_tables
  def index
    @spreadsheet_tables = SpreadsheetTable.all

    render json: @spreadsheet_tables
  end

  # GET /spreadsheet_tables/1
  def show
    render json: @spreadsheet_table
  end

  # POST /spreadsheet_tables
  def create
    @spreadsheet_table = SpreadsheetTable.new(spreadsheet_table_params)

    if @spreadsheet_table.save
      render json: @spreadsheet_table, status: :created, location: @spreadsheet_table
    else
      render json: @spreadsheet_table.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spreadsheet_tables/1
  def update
    if @spreadsheet_table.update(spreadsheet_table_params)
      render json: @spreadsheet_table
    else
      render json: @spreadsheet_table.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spreadsheet_tables/1
  def destroy
    @spreadsheet_table.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spreadsheet_table
      @spreadsheet_table = SpreadsheetTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spreadsheet_table_params
      params.require(:spreadsheet_table).permit(:name, :phone, :vehicle, :license_plate, :kms)
    end
end
