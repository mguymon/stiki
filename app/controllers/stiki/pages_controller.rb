require_dependency "stiki/application_controller"

module Stiki
  class PagesController < ApplicationController
    before_filter :get_space
    
    def index
      @pages = @space.pages
    end
    
    def show
      @page = Page.find( params[:id])
    end
    
    def new
      @page = Page.new
    end
    
    def edit
      
    end
    
    def create
      @page = Page.new(params[:page])
      @page.space = @space
      if @page.save
        redirect_to stiki.space_page_path(@space, @page)
      else
        flash[:error] = "Error creating Page"
        render "stiki/pages/new"
      end
    end
    
    def update
      
    end
    
    protected
    def get_space
      @space = Space.find( params[:space_id] )
      if @space.nil?
        redirect_to stiki.spaces_path
      end
    end
  end
end
