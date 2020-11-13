class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new({name: params["cocktail"]["name"]})
    cocktail.save
    redirect_to cocktail_path(cocktail.id)
  end
end

 #    cocktails GET  /cocktails(.:format)      cocktails#index
 #              POST /cocktails(.:format)      cocktails#create
 # new_cocktail GET  /cocktails/new(.:format)  cocktails#new
 #     cocktail GET  /cocktails/:id(.:format)  cocktails#show
