class MosquesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mosque, only: [ :edit, :update ]

  def index
    if current_user.present?
      @mosques = Mosque.includes(:area, :user).where(user_id: current_user.id)
    else
     redirect_to new_user_session_path
    end
  end

  def new
    if current_user.present?
      @mosque = Mosque.new
    else
      redirect_to new_user_session_path, alert: "Please login first to add a mosque."
    end
  end

  def create
    @mosque = Mosque.new(mosque_params)
    @mosque.user_id = current_user.id # logged-in user
    if @mosque.save
      redirect_to mosques_path, notice: "Masjid added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  def update
    if @mosque.update(mosque_params)
      redirect_to mosques_path, notice: "Masjid updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_mosque
    @mosque = Mosque.find(params[:id])
  end

  def mosque_params
    params.require(:mosque).permit(:name, :address, :area_id, :user_id, :google_link)
  end
end