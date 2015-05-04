class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def index
    @events = @project.events.all
  end

  # GET /events/new
  def show
    @event = @project.events.friendly.find(params[:id])
  end

  def new
    @event = @project.events.new
  end

  # GET /events/1/edit
  def edit
    @event = @project.events.friendly.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = @project.events.new(event_params)
    @event.user = current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to @project, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = @project.events.friendly.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to project_event_path(@project, @event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time)
    end
end
