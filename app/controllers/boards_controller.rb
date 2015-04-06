class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :create,:edit, :update, :destroy]
  # GET /boards
  # GET /boards.json
  def index

  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = @board = @project.boards.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = @project.boards.new(board_params)
    @board.owner = current_user
    @board.project = @project
    respond_to do |format|
      if @board.save
        format.html { redirect_to @project, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @project = Project.find(params[:project_id])
      @board = @project.boards.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :description)
    end
end
