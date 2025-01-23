module Admin
  class MosquesController < ApplicationController
    before_action :authenticate_user!
    authorize_resource

    def index
      @mosques = Mosque.all
      # @pending_mosques = Mosque.where(status: 'pending')
    end

    def pending
      @pending_mosques = Mosque.pending
    end

    def approved
      @active_mosques = Mosque.approved
    end
  end
end
