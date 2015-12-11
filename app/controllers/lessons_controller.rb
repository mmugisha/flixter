class LessonsController < ApplicationController
	before_action :require_login
	def show
		@enrollment = Enrollment.create(enrollment_params)
	end


	private
	helper_method :current_lesson
	def current_lesson
		@lesson ||= Lesson.find(params[:id])
	end

	
end
