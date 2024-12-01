class MosquesController < ApplicationController
  def index
    if current_user.present?
      @mosques = Mosque.includes(:area, :user).where(user_id: current_user.id)
    else
      @mosques = Mosque.all
    end
  end

  def edit
  end
end
