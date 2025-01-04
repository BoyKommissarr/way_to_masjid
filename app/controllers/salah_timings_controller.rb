class SalahTimingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @mosque = Mosque.find(params[:mosque_id])
    @salah_timing = SalahTiming.new
  end

  def create
    @mosque = Mosque.find(params[:mosque_id])
    @salah_timing = SalahTiming.new(salah_timing_params)
    @salah_timing.mosque_id = @mosque.id
    if @salah_timing.save
      redirect_to mosque_path(@mosque.id), notice: "salah added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

    def edit
    @mosque = Mosque.find(params[:mosque_id])
    @salah_timing = SalahTiming.find(params[:id])
  end

  def update
    @salah_timing = SalahTiming.find(params[:id])

    if @salah_timing.update(salah_timing_params)
      redirect_to mosques_path, notice: "Timings updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def salah_timing_params
    params.require(:salah_timing).permit(:name, :timing)
  end
end
