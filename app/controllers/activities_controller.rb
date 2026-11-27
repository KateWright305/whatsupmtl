class ActivitiesController < ApplicationController
  def index
    @activities = current_user.activities
    @chat = Chat.new
  end

  def show
    @activity = current_user.activities.find(params[:id])
    @groups = current_user.groups
  end

  def new
    @activity = current_user.activities.build
  end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      redirect_to activity_path(@activity)
    else
      redirect_back fallback_location: chats_path, alert: @activity.errors.map(&:message).to_sentence
    end
  end

  def add_to_groups
    @activity = current_user.activities.find(params[:id])
    @groups = Group.all

    @selected_group_ids = @activity.groups.pluck(:id)
  end

  def save_groups
    @activity = current_user.activities.find(params[:id])

    group_ids = params[:group_ids] || []

    @activity.groups = Group.where(id: group_ids)

    redirect_to activity_path(@activity),
                notice: "Activity successfully added to groups."
  end

  def remove_group
    @activity = current_user.activities.find(params[:id])
    @group = Group.find(params[:group_id])

    @activity.groups.delete(@group)

    redirect_to activity_path(@activity),
                notice: "#{@group.name} was removed from this activity."
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy

    redirect_to activities_path, notice: "Activity successfully deleted."
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :url, :location, :price, :img, :starts_at, :ends_at)
  end
end
