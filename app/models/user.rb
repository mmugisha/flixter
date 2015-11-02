class User < ActiveRecord::Base
  has_many :courses
  include Clearance::User
end
