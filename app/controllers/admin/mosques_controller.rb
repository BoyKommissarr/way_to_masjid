module Admin
  class MosquesController < ApplicationController
    before_action :authenticate_user!
    authorize_resource

    layout 'admin'

    def index
      @mosques = Mosque.all
      @type = 'all'
      if params[:status] == 'pending'
        @mosques = Mosque.pending
        @type = 'pending'
      elsif params[:status] == 'approved'
        @mosques = Mosque.approved
        @type = 'approved'
      end
    end
  end
end
