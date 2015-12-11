class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def show

	end

	helper_method :current_course
	def current_course
		@course ||= Course.find(params[:id])
	end

	

end
