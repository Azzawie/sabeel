class DailyStatementsController < ApplicationController
  before_action :set_daily_statement, only: %i[ show edit update destroy ]

  # GET /daily_statements or /daily_statements.json
  def index
    @daily_statements = DailyStatement.all
  end

  # GET /daily_statements/1 or /daily_statements/1.json
  def show
  end

  # GET /daily_statements/new
  def new
    @daily_statement = DailyStatement.new
  end

  # GET /daily_statements/1/edit
  def edit
  end

  # POST /daily_statements or /daily_statements.json
  def create
    @daily_statement = DailyStatement.new(daily_statement_params)

    respond_to do |format|
      if @daily_statement.save
        format.html { redirect_to daily_statement_url(@daily_statement), notice: "Daily statement was successfully created." }
        format.json { render :show, status: :created, location: @daily_statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_statements/1 or /daily_statements/1.json
  def update
    respond_to do |format|
      if @daily_statement.update(daily_statement_params)
        format.html { redirect_to daily_statement_url(@daily_statement), notice: "Daily statement was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_statements/1 or /daily_statements/1.json
  def destroy
    @daily_statement.destroy

    respond_to do |format|
      format.html { redirect_to daily_statements_url, notice: "Daily statement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_statement
      @daily_statement = DailyStatement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_statement_params
      params.require(:daily_statement).permit(:age_days, :age_weeks, :total_count, :deceased, :remaining, :consumed_food, :consumed_water, :daily_production, :production_ratio, :highest_temp, :lowest_temp, :humidity_ratio, :chamber_id)
    end
end
