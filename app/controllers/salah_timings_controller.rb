class SalahTimingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_mosque

  def new
    @salah_timing = SalahTiming.new
  end

  def create
    @salah_timing = SalahTiming.new(salah_timing_params)
    @salah_timing.mosque_id = @mosque.id
    if @salah_timing.save
      redirect_to mosque_path(@mosque.id), notice: "Namaz timings added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

    def edit
    @salah_timing = SalahTiming.find(params[:id])
  end

  def update
    @salah_timing = SalahTiming.find(params[:id])

    if @salah_timing.update(salah_timing_params)
      redirect_to mosque_path(@mosque.id), notice: "Namaz Timings updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def salah_timing_params
    params.require(:salah_timing).permit(:name, :timing)
  end

  def find_mosque
    @mosque = Mosque.find(params[:mosque_id])
  end
end
