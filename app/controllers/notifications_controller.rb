class NotificationsController < ApplicationController
  def index
    @project = Project.friendly.find(params[:project_id])
    @activities = PublicActivity::Activity.where(owner_id: @project.users, owner_type: 'User' )
    respond_to do |format|
      format.html
      format.js
    end
  end
end
