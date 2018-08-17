class DetallesController < ApplicationController
  before_action :set_detalle, only: [:show, :update, :destroy]

  # GET /detalles
  def index
    @detalles = Detalle.all

    render json: @detalles
  end

  # GET /detalles/1
  def show
    render json: @detalle
  end
  
  # POST /detalles
  def create
    @detalle = Detalle.new(detalle_params)

    if @detalle.save
      render json: @detalle, status: :created, location: @detalle
    else
      render json: @detalle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /detalles/1
  def update
    if @detalle.update(detalle_params)
      render json: @detalle
    else
      render json: @detalle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /detalles/1
  def destroy
    @detalle.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle
      @detalle = Detalle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def detalle_params
      params.require(:detalle).permit(:nofra, :codigoprd, :cantidad, :impuesto, :precio)
    end
end
