class Website < ActiveRecord::Base
  attr_accessible :active, :body, :head, :headline, :keywords
  enable_logging
end
