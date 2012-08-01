module Stiki
  module ApplicationHelper
    def stiki
      Stiki::Engine.routes.url_helpers
    end
  end
end
