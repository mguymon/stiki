require_dependency "stiki/application_controller"
require 'redcarpet'

module Stiki
  class PagesController < ApplicationController
    before_filter :get_space
    
    def index
      @pages = @space.pages
    end
    
    def show
      @page = Page.find( params[:id])
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
      @markup = markdown.render( @page.body ).html_safe 
    end
    
    def new
      @page = Page.new
    end
    
    def edit
      @page = Page.find( params[:id] )
      
    end
    
    def create
      @page = Page.new(params[:page])
      @page.space = @space
      
      if Stiki.authenticate_by == :devise
        @page.user = send.send( "current_#{Stiki::Helper.user_model_name}".to_sym )
      end
      
      if @page.save
        redirect_to stiki.space_page_path(@space, @page)
      else
        flash[:error] = "Error creating Page"
        render "stiki/pages/new"
      end
    end
    
    def update
      @page = Page.find( params[:id] )
      
      if @page.update_attributes( params[:page] )
        redirect_to stiki.space_page_path(@space, @page)
      else
        flash[:error] = "Error editing Page"
        render "stiki/pages/edit"
      end
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
