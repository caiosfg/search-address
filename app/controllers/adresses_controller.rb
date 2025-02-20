class AdressesController < ApplicationController
  before_action :set_adress, only: %i[ show edit update destroy ]

  # GET /adresses or /adresses.json
  def index
    @adresses = Adress.all
  end

  # GET /adresses/1 or /adresses/1.json
  def show
  end

  # GET /adresses/new
  def new
    @adress = Adress.new
  end

  # GET /adresses/1/edit
  def edit
  end

  # POST /adresses or /adresses.json
  def create
    @adress = Adress.new(adress_params)

    respond_to do |format|
      if @adress.save
        format.html { redirect_to adress_url(@adress), notice: "Adress was successfully created." }
        format.json { render :show, status: :created, location: @adress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adresses/1 or /adresses/1.json
  def update
    respond_to do |format|
      if @adress.update(adress_params)
        format.html { redirect_to adress_url(@adress), notice: "Adress was successfully updated." }
        format.json { render :show, status: :ok, location: @adress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adresses/1 or /adresses/1.json
  def destroy
    @adress.destroy!

    respond_to do |format|
      format.html { redirect_to adresses_url, notice: "Adress was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      @adress = Adress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adress_params
      params.require(:adress).permit(:title, :description, :location)
    end
end
