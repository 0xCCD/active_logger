module ActiveLogger
  
  module Controller
    
    class << self

      def included(base)
        base.class_eval do
          base.include InstanceMethods if !constants.include?(InstanceMethods)
          before_filter :set_current_user
        end # class_eval
      end # included

    end # << self
    
    module InstanceMethods
      def set_current_user
        ActiveLogger::User.user = current_user.id if current_user
      end # set_current_user
    end # InstanceMethods
    
  end # Controller
  
end # ActiveLogger