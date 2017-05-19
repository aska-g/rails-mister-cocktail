class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :update, :destroy]

  def index
    @doses = Dose.all

    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all

  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose = Dose.new(dose_params)

    # respond_to do |format|
    if @dose.save
      redirect_to @cocktail

    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:cocktail_id])
    @ingredient = @dose.ingredient

  end

  def update

    # respond_to do |format|
    if @dose.update(dose_params)
      redirect_to @dose.cocktail

    else
      render :new
    end
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to @cocktail, notice: 'dose was successfully deleted.' }
      format.json { head :no_content }
    end


  end


  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
  def set_dose
    @dose = Dose.find(params[:id])
  end
end

