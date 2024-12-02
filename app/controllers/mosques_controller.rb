class MosquesController < ApplicationController
  def index
    if current_user.present?
      @mosques = Mosque.includes(:area, :user).where(user_id: current_user.id)
    else
      @mosques = Mosque.all
    end
  end

  def edit
    @mosque = Mosque.find(params[:id])
end

def update
    @mosque = Mosque.find(params[:id])
  if @mosque.update (mosque_params)
    redirect_to "/mosques", notice: "You have succesfully updated the Mosque details.!"
  else 
    flash[:alert] = "ERROR!! Mosque update failed kindly check the desired fields.!"  
    render :edit, status: :unprocessable_entity
  end
end

private 
def mosque_params
    params.require(:mosque).permit(:name, :adress, :google_link)
end

end
