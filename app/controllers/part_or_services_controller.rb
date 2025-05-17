class PartOrServicesController < ApplicationController
  before_action :set_part_or_service, only: %i[ show update destroy ]

  # GET /part_or_services
  def index
    @part_or_services = PartOrService.all

    render json: @part_or_services
  end

  # GET /part_or_services/1
  def show
    render json: @part_or_service
  end

  # POST /part_or_services
  def create
    @part_or_service = PartOrService.new(part_or_service_params)

    if @part_or_service.save
      render json: @part_or_service, status: :created, location: @part_or_service
    else
      render json: @part_or_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /part_or_services/1
  def update
    if @part_or_service.update(part_or_service_params)
      render json: @part_or_service
    else
      render json: @part_or_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /part_or_services/1
  def destroy 
    @part_or_service.destroy!
  end

  # DELETE /part_or_services/by_spreadsheet/:spreadsheet_table_id
  def destroy_by_spreadsheet
    parts_or_services = PartOrService.where(spreadsheet_table_id: params[:spreadsheet_table_id])

    if parts_or_services.destroy_all
      render json: { message: "Peças ou serviços excluídos com sucesso." }, status: :ok
    else
      render json: { error: "Erro ao excluir peças ou serviços." }, status: :unprocessable_entity
    end
  end


  # GET /part_or_services/by_spreadsheet/:spreadsheet_table_id
  def by_spreadsheet
    @part_or_services = PartOrService.where(spreadsheet_table_id: params[:spreadsheet_table_id])
    render json: @part_or_services
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_or_service
      @part_or_service = PartOrService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_or_service_params
      params.require(:part_or_service).permit(:category, :quantity, :name, :price, :spreadsheet_table_id)
    end
end
