class User < ActiveRecord::Base
  include Clearance::User
  has_many :courses
  validates :password, confirmation: true, presence:true
  validates :password_confirmation, presence: true
end
