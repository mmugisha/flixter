class User < ActiveRecord::Base
  include Clearance::User
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, :through => :enrollments, :source=> :course
  
  validates :password, confirmation: true, presence:true
  validates :password_confirmation, presence: true

  def can_admin_course?(course)
  	course.user == self  
  end

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end

end