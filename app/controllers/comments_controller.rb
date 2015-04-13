class CommentsController < ApplicationController
	before_action :authenticate_user!
	#before_action :set_board
	before_action :own_auth, only: [:edit, :update, :destroy]

	def create
		@board = Board.friendly.find(params[:board_id])
		@comment = @board.comments.new comment_params
		@comment.user = current_user
		respond_to do |format|
			if @comment.save
				format.html {redirect_to project_board_path(params[:project_id], @board), notice: "Added the comment"}
				format.js
			end
		end
	end

	def edit
		@board = Board.friendly.find(params[:board_id])
		@comment = @board.comments.find(params[:id])
	end

	def update
		@board = Board.friendly.find(params[:board_id])
		@comment = @board.comments.find(params[:id])
		if @comment.update(comment_params)
			respond_to do |format|
				format.html { redirect_to project_board_path(params[:project_id], @board), notice: "Updated the comment"}
				format.js
			end
		end
	end

	def destroy
		@board = Board.friendly.find(params[:board_id])
		@comment = @board.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to project_board_path(params[:project_id], @board), notice: "Updated the comment"}
			format.js
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def set_board
		@board = Board.friendly.find(params[:board_id])
	end

	def set_comment
		@comment = @board.comments.find(params[:id])
	end

	def own_auth
		set_board
		set_comment
		if current_user != @comment.user && !user_signed_in?
			redirect_to @board, notice: "You do not have admin rights"
		end
	end
end
