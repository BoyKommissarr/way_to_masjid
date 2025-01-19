class WelcomeController < ApplicationController
  def index
  end

  def suggest
    @mosque = Mosque.new
  end

  def create
    @mosque = Mosque.new(mosque_params)
    @mosque.user = User.super_admin
    if @mosque.save
      redirect_to root_path, notice: "Thank You for your valuable suggestion. Your input has been added for review"
    else
      flash[:alert] = "Could not add suggestion"
      render :suggest, status: :unprocessable_entity
    end
  end

  private
  def mosque_params
    params.require(:mosque).permit(:name, :address, :area_id, :user_id, :status, :google_link)
  end
end
