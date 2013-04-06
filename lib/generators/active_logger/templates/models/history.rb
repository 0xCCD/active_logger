module ActiveLogger
  class <%= logger_class_name %> < ActiveRecord::Base
    attr_accessible :user_id, :logged_for, :logged_for_id, :i18n, :body
    has_many <%= ":#{logger_class_name.underscore}" %>_values
  end
end