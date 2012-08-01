require_dependency "stiki/application_controller"

module Stiki
  class PagesController < ApplicationController
    def index
      @space = Space.find( params[:space_id] )
      @pages = @space.pages
    end
  end
end
