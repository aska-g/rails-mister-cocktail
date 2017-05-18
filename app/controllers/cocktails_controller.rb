class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktails.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    # respond_to do |format|
    if @cocktail.save
      redirect_to @cocktail
      format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
      format.json { render :show, status: :created, location: @cocktail }
    else
      format.html { render :new }
      format.json { render json: @cocktail.errors, status: :unprocessable_entity }
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
    params.require(:cocktail).permit(:name)
  end
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
