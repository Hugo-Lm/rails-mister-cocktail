class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @doseNew = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doseNew.cocktail = @cocktail
    if @doseNew.save!
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render 'cocktails/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    id = dose.cocktail.id
    dose.destroy
    redirect_to cocktail_path(id)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end

   # cocktail_doses POST /cocktails/:cocktail_id/doses(.:format)       doses#create
 # new_cocktail_dose GET  /cocktails/:cocktail_id/doses/new(.:format)   doses#new
