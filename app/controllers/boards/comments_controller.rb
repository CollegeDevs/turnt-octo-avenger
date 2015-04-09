class Boards::CommentsController < CommentsController
	before_action :set_commentable
	before_action :set_comment, except: [:new, :create]
	private

	def set_commentable
		@commentable = Board.find(params[:board_id])
	end
	def set_comment
		@comment = @commentable.comments.find(params[:id])
	end

end
