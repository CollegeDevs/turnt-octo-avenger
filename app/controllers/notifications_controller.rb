class NotificationsController < ApplicationController
  def index
  @project = Project.friendly.find(params[:project_id])
  @activities = PublicActivity::Activity.where(owner_id: @project.users, owner_type: 'User' )
  end
end
