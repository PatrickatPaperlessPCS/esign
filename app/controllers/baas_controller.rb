class BaasController < ApplicationController
  before_action :set_baa, only: [:show, :edit, :update, :destroy]

  # GET /baas
  # GET /baas.json
  def index
    @baas = Baa.all
  end

  # GET /baas/1
  # GET /baas/1.json
  def show
  end

  # GET /baas/new
  def new
    @baa = Baa.new
  end

  # GET /baas/1/edit
  def edit
  end

  # POST /baas
  # POST /baas.json
  def create
    @baa = Baa.new(baa_params)

    respond_to do |format|
      if @baa.save
        format.html { redirect_to @baa, notice: 'Baa was successfully created.' }
        format.json { render :show, status: :created, location: @baa }
      else
        format.html { render :new }
        format.json { render json: @baa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baas/1
  # PATCH/PUT /baas/1.json
  def update
    respond_to do |format|
      if @baa.update(baa_params)
        format.html { redirect_to @baa, notice: 'Baa was successfully updated.' }
        format.json { render :show, status: :ok, location: @baa }
      else
        format.html { render :edit }
        format.json { render json: @baa.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /baas/1
  # DELETE /baas/1.json
  def destroy
    @baa.destroy
    respond_to do |format|
      format.html { redirect_to baas_url, notice: 'Baa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baa
      @baa = Baa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baa_params
      params.require(:baa).permit(:signature, :user_id)
    end
end
