require 'spec_helper'
require 'stiki/auth/devise'

describe Stiki::Auth::Devise do
  
  describe "include in Controllers" do
    before do
      Stiki.config do |stiki|
        stiki.auth = :devise
        stiki.auth_pages_actions = [:blue, :green, :orange ]
        stiki.auth_spaces_actions = [:new, :create, :edit, :update]
      end
    end
    
    it "should set before_filter in PagesController" do
      Stiki::PagesController.filters[:before].should include( :authenticate_user! )
    end
    
    it "should set before_filter in SpacesController" do
      Stiki::SpacesController.filters[:before].should include( :authenticate_user! )
    end

  end
  
end