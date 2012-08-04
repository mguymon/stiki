require 'spec_helper'
require 'stiki'


describe Stiki do
  
  describe "#config" do
    before do
      Stiki.config do |stiki|
        stiki.authenticate_by = :devise
        stiki.user_class = 'Author'
        stiki.authenticate_pages_actions = {:only =>  [:blue, :green, :orange ] }
        stiki.authenticate_spaces_actions = {:only => [:new, :create, :edit, :update] }
      end
    end
    
    it "should set auth" do
      Stiki.authenticate_by.should eql :devise
    end
    
    it "should set auth_pages_actions" do
      Stiki.authenticate_pages_actions[:only].should eql( [:blue, :green, :orange ] )
    end
    
    it "should set auth_spaces_actions" do
      Stiki.authenticate_spaces_actions[:only].should eql( [:new, :create, :edit, :update] )
    end
  end
  
end