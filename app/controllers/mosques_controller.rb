class MosquesController < ApplicationController
  before_action :authenticate_user!, except: [ :search, :show ]
  before_action :set_mosque, only: [ :edit, :update, :show ]

  def index
    @mosques = Mosque.includes(:area, :user).where(user_id: current_user.id)
  end

  def new
    @mosque = Mosque.new
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

  def search
    @mosques = Mosque.where(area_id: params[:query])
  end

  def show; end

  private

  def set_mosque
    @mosque = Mosque.find(params[:id])
  end

  def mosque_params
    params.require(:mosque).permit(:name, :address, :area_id, :user_id, :google_link)
  end
end
