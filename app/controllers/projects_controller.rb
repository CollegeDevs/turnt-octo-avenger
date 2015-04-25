class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :team]
  before_action :authenticate_user!
  before_action :own_auth, only: [:edit, :update, :destroy, :invite_user]
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    @pu = current_user.projectusers.new
    @pu.project = @project
    @pu.save
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def team
    @users = @project.users
    respond_to do |format|
      format.html
      format.js
    end
  end


  def invite_user
    @user = User.friendly.find_by_email(params[:my_input])
    @project = Project.friendly.find(params[:id])
    if @project.users.include? @user
      redirect_to @project, notice: 'Already a member'
    elsif @user
      @pu = @user.projectusers.new
      @pu.project = @project
      @pu.save
      redirect_to @project, notice: 'User was successfully Added.'
    else
      redirect_to @project, notice: 'Could not found the User'
    end
  end

  def remove_user

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :make_public, :user_key)
    end

    def own_auth
      @project = Project.friendly.find(params[:id])
      if current_user != @project.owner && !user_signed_in?
        redirect_to @project, notice: "You do not have admin rights"
      end
    end
end
