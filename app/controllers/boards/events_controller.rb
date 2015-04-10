class Events::EventsController < EventsController
  before_action :set_element

  private

	def set_element
		@element = Board.find(params[:board_id])	
	end


 end
end
