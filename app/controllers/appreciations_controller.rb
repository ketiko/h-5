class AppreciationsController < ApplicationController
  before_action :set_appreciation, only: [:show, :edit, :update, :destroy]
  before_action :set_give_appreciation, only: [:give]

  # GET /appreciations
  # GET /appreciations.json
  def index
    @appreciations = Appreciation.all
  end

  # GET /appreciations/1
  # GET /appreciations/1.json
  def show
  end

  # GET /appreciations/new
  def new
    @appreciation = Appreciation.new
  end

  # GET /appreciations/1/edit
  def edit
  end

  # POST /appreciations
  # POST /appreciations.json
  def create
    @appreciation = Appreciation.new(appreciation_params)

    respond_to do |format|
      if @appreciation.save
        format.html { redirect_to @appreciation, notice: 'Appreciation was successfully created.' }
        format.json { render :show, status: :created, location: @appreciation }
      else
        format.html { render :new }
        format.json { render json: @appreciation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appreciations/1
  # PATCH/PUT /appreciations/1.json
  def update
    respond_to do |format|
      if @appreciation.update(appreciation_params)
        format.html { redirect_to @appreciation, notice: 'Appreciation was successfully updated.' }
        format.json { render :show, status: :ok, location: @appreciation }
      else
        format.html { render :edit }
        format.json { render json: @appreciation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appreciations/1
  # DELETE /appreciations/1.json
  def destroy
    @appreciation.destroy
    respond_to do |format|
      format.html { redirect_to appreciations_url, notice: 'Appreciation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def give
    respond_to do |format|
      if @appreciation.give
        format.html { redirect_to @appreciation, notice: 'Appreciation was given.' }
        format.json { render :show, status: :ok, location: @appreciation }
      else
        format.html { redirect_to @appreciation, notice: 'Appreciation has already been given.' }
        format.json { render json: @appreciation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appreciation
    @appreciation = Appreciation.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_give_appreciation
    @appreciation = Appreciation.find_by(token: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appreciation_params
    params.require(:appreciation).permit(:user_id, :points, :token)
  end
end
