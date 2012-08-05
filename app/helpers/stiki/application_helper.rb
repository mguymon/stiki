module Stiki
  module ApplicationHelper
    def stiki_routes
      Stiki::Engine.routes.url_helpers
    end
    
    def use_auth?
      Stiki.authenticate_by
    end
    
    def user_name( author )
      author.user.send( Stiki.user_name_via ) if author && author.user
    end
  end
end
