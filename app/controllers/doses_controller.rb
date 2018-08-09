class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.order(:name)
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id]) if params[:cocktail_id].present?
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id]) if params[:dose][:ingredient_id].present?
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      @ingredients = Ingredient.order(:name)
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
