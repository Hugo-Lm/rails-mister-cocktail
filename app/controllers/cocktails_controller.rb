class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new(cocktail_params)
    cocktail.save
    redirect_to cocktail_path(cocktail.id)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit([:name, :photo])
  end
end

 #    cocktails GET  /cocktails(.:format)      cocktails#index
 #              POST /cocktails(.:format)      cocktails#create
 # new_cocktail GET  /cocktails/new(.:format)  cocktails#new
 #     cocktail GET  /cocktails/:id(.:format)  cocktails#show
