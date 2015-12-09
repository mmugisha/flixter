class Instructor::SectionsController < ApplicationController
	before_action :require_login
	before_action :require_authorized_for_current_course

	def new
		if current_course.user != current_user
			return render :text => "Unauthorized", :status=>:unauthorized
		end
		@section = Section.new
	end

	def create
		@section = current_course.sections.create(section_params)
		if @section.valid?
			redirect_to instructor_course_path(current_course)
		else
			render :url => new_instructor_course_section(current_course)
		end
	end

	private

	helper_method :current_course
	def current_course
		@current_course ||= Course.find(params[:course_id])
	end

	def require_authorized_for_current_course
		if current_course.user != current_user
			render :text => "Unauthorized", :status=>:unauthorized
		end
	end

	def section_params
		params.require(:section).permit(:title)
	end
end
