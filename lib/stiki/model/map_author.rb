require 'stiki/model'
require 'active_support/concern'

module Stiki::Model::MapAuthor
  extend ActiveSupport::Concern
  
  included do
    belongs_to :user, :class_name => Stiki.user_class
  end
end