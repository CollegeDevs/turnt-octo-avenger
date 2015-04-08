class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :update]
	before_action :authenticate_user!

	def create
		@comment = @commentable.comments.new comment_params
		@comment.user = current_user
		if @comment.save
			redirect_to project_board_path(params[:project_id], @commentable), notice: "Added the comment"
		end
	end

	def edit
		
	end

	def update
		@comment.update(comment_params)
		redirect_to project_board_path(params[:project_id], @commentable), notice: "Updated the comment"
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to project_board_path(params[:project_id], @commentable)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

end
