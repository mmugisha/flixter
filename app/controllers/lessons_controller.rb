class LessonsController < ApplicationController
	before_action :require_login
	before_action :require_enrollment
	def show
	end


	private
	helper_method :current_lesson
	def current_lesson
		@lesson ||= Lesson.find(params[:id])
	end

	helper_method :require_enrollment
	def require_enrollment
		if !current_user.enrolled_in?(current_lesson.section.course)
			redirect_to course_path(current_lesson.section.course),
			:alert => 'You need to enroll in the course before seeing the lessons'
		end

	end


end
