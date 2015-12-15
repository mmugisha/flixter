class Instructor::SectionsController < ApplicationController
	before_action :require_login
	before_action :require_authorized_for_current_course,  :only=>[:new, :create]
	before_action :require_authorized_for_current_section, :only => [:update]

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

	def update
		@boolean = current_section.update_attributes(section_params)
		puts @boolean.to_s
		#current_section.update(row_order: params[:row_order])
		render :text => 'Updated!'
	end

	private

	helper_method :current_course
	def current_course
		@current_course ||= Course.find(params[:course_id])
	end

	def current_section
		@current_section ||= Section.find(params[:id])
	end

	def require_authorized_for_current_course
		if current_course.user != current_user
			render :text => "Unauthorized", :status=>:unauthorized
		end
	end

	def require_authorized_for_current_section
		if current_section.course.user != current_user
			render :text => 'Unauthorized', :status => :unauthorized
		end
	end

	def section_params
		params.require(:section).permit(:title, :row_order_position)
	end
end
