class ChambersController < ApplicationController
  before_action :set_chamber, only: %i[ show edit update destroy ]

  # GET /chambers or /chambers.json
  def index
    @chambers = Chamber.all
  end

  # GET /chambers/1 or /chambers/1.json
  def show
  end

  # GET /chambers/new
  def new
    @chamber = Chamber.new
  end

  # GET /chambers/1/edit
  def edit
  end

  # POST /chambers or /chambers.json
  def create
    @chamber = Chamber.new(chamber_params)

    respond_to do |format|
      if @chamber.save
        format.html { redirect_to chamber_url(@chamber), notice: "Chamber was successfully created." }
        format.json { render :show, status: :created, location: @chamber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chamber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chambers/1 or /chambers/1.json
  def update
    respond_to do |format|
      if @chamber.update(chamber_params)
        format.html { redirect_to chamber_url(@chamber), notice: "Chamber was successfully updated." }
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
      format.html { redirect_to chambers_url, notice: "Chamber was successfully destroyed." }
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
