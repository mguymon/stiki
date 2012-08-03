require 'stiki'
require 'stiki/auth'

module Stiki::Auth::Devise
  def self.included(base)
    if Stiki.auth_mapping
      auth_required = Stiki.auth_mapping[base.controller_name.to_sym]
      if auth_required
        base.before_filter :authenticate_user!, :only => auth_required
      end
    else
      raise "Stiki.auth_mapping was nil"
    end
  end 
end