require 'stiki'
require 'stiki/authenticate'

module Stiki::Authenticate::Devise
  def self.included(base)
    if Stiki.auth_mapping
      auth_required = Stiki.auth_mapping[base.controller_name.to_sym]
      if auth_required
        if auth_required == :all
          base.before_filter "authenticate_#{Stiki::Helper.user_model_name}!".to_sym, :if => lambda {|c| Stiki.authenticate_by == :devise }
        else
          base.before_filter "authenticate_#{Stiki::Helper.user_model_name}!".to_sym, auth_required.merge( :if => lambda {|c| Stiki.authenticate_by == :devise } )
        end
      end
    else
      raise "Stiki.auth_mapping was nil"
    end
  end 
end