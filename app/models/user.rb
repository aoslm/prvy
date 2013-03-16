class User < ActiveRecord::Base
  attr_accessible :String, :String, :email, :name
end
