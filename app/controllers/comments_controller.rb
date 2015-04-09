class CommentsController < ApplicationController
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
		if @comment.update(comment_params)
			redirect_to project_board_path(params[:project_id], @commentable), notice: "Updated the comment"
		end
	end

	def destroy
		@comment.destroy
		redirect_to project_board_path(params[:project_id], @commentable)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

end
