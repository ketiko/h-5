class AppreciationsController < ApplicationController
  before_action :set_appreciation, only: [:show, :edit, :update, :destroy]
  before_action :set_give_appreciation, only: [:give]

  # GET /appreciations
  # GET /appreciations.json
  def index
    @appreciations = Appreciation.all
    @appreciations_json = @appreciations.to_json(include: :user)
  end

  # GET /appreciations/1
  # GET /appreciations/1.json
  def show
    @appreciation_json = @appreciation.to_json(include: :user)
  end

  def give
    @appreciation.give
    @appreciation_json = @appreciation.to_json(include: :user)
  end

  def update
    @appreciation.update(update_params)
    redirect_to give_appreciation_path(@appreciation.token)
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

  def update_params
    params.permit(:comments, :giver_name, :likes)
  end
end
