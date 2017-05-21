class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    # respond_to do |format|
    if @cocktail.save
      redirect_to @cocktail

    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Cocktail was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :ptoho_cache)
  end
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
