class ChambersController < ApplicationController
  before_action :set_chamber, only: %i[show edit update destroy]

  # GET /chambers or /chambers.json
  def index
    @chambers = Chamber.all.page(params[:page])
    authorize @chambers
  end

  # GET /chambers/1 or /chambers/1.json
  def show
    # No need to pass an object just the class neme
    authorize @chamber
  end

  # GET /chambers/new
  def new
    @chamber = Chamber.new
    authorize @chamber
  end

  # GET /chambers/1/edit
  def edit
    # No need to pass an object just the class neme
    authorize Chamber.new
  end

  # POST /chambers or /chambers.json
  def create
    @chamber = Chamber.new(chamber_params)
    authorize @chamber

    respond_to do |format|
      if @chamber.save
        format.html { redirect_to chamber_url(@chamber), success: t('chambers.create') }
        format.json { render :show, status: :created, location: @chamber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chamber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chambers/1 or /chambers/1.json
  def update
    # No need to pass an object just the class neme
    authorize @chamber
    respond_to do |format|
      if @chamber.update(chamber_params)
        format.html { redirect_to chamber_url(@chamber), success: t('chambers.update') }
        format.json { render :show, status: :ok, location: @chamber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chamber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chambers/1 or /chambers/1.json
  def destroy
    @chamber.destroy

    respond_to do |format|
      format.html { redirect_to chambers_url, success: t('chambers.destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chamber
    @chamber = Chamber.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chamber_params
    params.require(:chamber).permit(:name, :description, :notes)
  end
end
