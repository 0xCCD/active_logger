module ActiveLogger
  class MyHistoryValue < ActiveRecord::Base

    attr_accessible :my_history_id, :key, :value

    belongs_to :my_history
    
  end
end