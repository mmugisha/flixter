class LessonsController < ApplicationController
	before_action :require_login
	def show
	end


	private
	helper_method :current_lesson
	def current_lesson
		@lesson ||= Lesson.find(params[:id])
	end
end
