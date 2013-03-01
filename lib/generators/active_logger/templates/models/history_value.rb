module ActiveLogger
  class <%= logger_class_name %>Value < ActiveRecord::Base

    attr_accessible :<%= logger_class_name.underscore %>_id, :key, :value

    belongs_to :<%= logger_class_name.underscore %>
    
  end
end