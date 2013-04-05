class User < ActiveRecord::Base
  attr_accessible :active, :email, :encrypted_password, :last_login_at, :remember_created_at, :username
  enable_logging
end
