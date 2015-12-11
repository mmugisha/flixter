class User < ActiveRecord::Base
  include Clearance::User
  has_many :courses
  validates :password, confirmation: true, presence:true
  validates :password_confirmation, presence: true

  def can_admin_course?(course)
  	course.user == self  
  end
end