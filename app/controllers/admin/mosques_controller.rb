module Admin
  class MosquesController < ApplicationController
    before_action :authenticate_user!
    authorize_resource

    def index
      @mosques = Mosque.all
      # @pending_mosques = Mosque.where(status: 'pending')
    end
  end
end
