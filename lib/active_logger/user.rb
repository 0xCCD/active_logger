module ActiveLogger
  
  module User
    
    class << self
      
      def user_id 
        Thread.current[:user_id]
      end # user

      def user_id= user_id
        Thread.current[:user_id] = user_id
      end # user=
      
    end # << self

  end # User
  
end # ActiveLogger