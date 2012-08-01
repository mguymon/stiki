require_dependency "stiki/application_controller"

module Stiki
  class SpacesController < ApplicationController
    def index
      @spaces = Space.all
      @space = Space.new
    end
    
    def create
      @space = Space.new(params[:space])
      unless @space.save
        flash[:error] = "Error creating new Space"
      end
      
      redirect_to stiki.spaces_path
    end
  end
end
