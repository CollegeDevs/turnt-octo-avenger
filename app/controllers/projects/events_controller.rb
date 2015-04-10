class Projects::EventsController < EventsController
  before_action :set_element

  private
	
	def set_element
		@element = Project.find(params[:project_id])	
	end
end
