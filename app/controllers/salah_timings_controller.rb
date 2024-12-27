class SalahTimingsController < ApplicationController
  before_action :authenticate_user!

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
