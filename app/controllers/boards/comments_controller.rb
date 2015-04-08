class Boards::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = Board.find(params[:board_id])
	end

end
