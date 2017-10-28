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

  def give
    @appreciation.give
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
end
