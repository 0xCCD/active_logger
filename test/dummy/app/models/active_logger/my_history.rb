module ActiveLogger
  class MyHistory < ActiveRecord::Base
    attr_accessible :user_id, :logged_for, :logged_for_id, :i18n, :body
    has_many :my_history_values
    
    def active_logger_history_values
      my_history_values
    end
    
  end
end