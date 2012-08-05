require_dependency "stiki/application_controller"

module Stiki
  class SpacesController < ApplicationController
    def index
      @spaces = Space.all
      @space = Space.new
    end
    
    def create
      @space = Space.new(params[:space])
      
      if Stiki.authenticate_by == :devise
        author = Author.new
        author.user = self.send( "current_#{Stiki::Helper.user_model_name}".to_sym )
        author.creator = true
        @space.authors << author
      end
      
      unless @space.save
        flash[:error] = "Error creating new Space"
      end
      
      redirect_to stiki_routes.spaces_path
    end
  end
end
