class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @groups = Group.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add_to_groups
    @activity = Activity.find(params[:id])
    @groups = Group.all

    @selected_group_ids = @activity.groups.pluck(:id)
  end

  def save_groups
    @activity = Activity.find(params[:id])

    group_ids = params[:group_ids] || []

    @activity.groups = Group.where(id: group_ids)

    redirect_to activity_path(@activity),
                notice: "Activity successfully added to groups."
  end

  def remove_group
    @activity = Activity.find(params[:id])
    @group = Group.find(params[:group_id])

    @activity.groups.delete(@group)

    redirect_to activity_path(@activity),
                notice: "#{@group.name} was removed from this activity."
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :url, :location, :price, :img, :starts_at, :ends_at)
  end
end
