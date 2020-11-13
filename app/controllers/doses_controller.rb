class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    doseNew = Dose.new({description: params[:dose][:description],
                        ingredient_id: params[:dose][:ingredient_id],
                        cocktail_id: params[:cocktail_id] })
    doseNew.save!
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    dose = Dose.find(params[:id])
    id = dose.cocktail.id
    dose.destroy
    redirect_to cocktail_path(id)
  end
end

   # cocktail_doses POST /cocktails/:cocktail_id/doses(.:format)       doses#create
 # new_cocktail_dose GET  /cocktails/:cocktail_id/doses/new(.:format)   doses#new
