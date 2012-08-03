require 'spec_helper'
require 'stiki'

describe Stiki do
  
  describe "#config" do
    before do
      Stiki.config do |stiki|
        stiki.auth = :devise
        stiki.auth_pages_actions = [:blue, :green, :orange ]
        stiki.auth_spaces_actions = [:new, :create, :edit, :update]
      end
    end
    
    it "should set auth" do
      Stiki.auth.should eql :devise
    end
    
    it "should set auth_pages_actions" do
      Stiki.auth_pages_actions.should eql [:blue, :green, :orange ]
    end
    
    it "should set auth_spaces_actions" do
      Stiki.auth_spaces_actions.should eql [:new, :create, :edit, :update]
    end
  end
end