class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:activities).order(created_at: :desc)
    @activities = Activity.all
  end

  def new
    @group = Group.new
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group, notice: "Group successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @group = Group.includes(:activities).find(params[:id])
    @activities = Activity.where.not(id: @group.activities.ids)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group, notice: "Group successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def add_activity
    @group = Group.find(params[:id])

    activity_ids = params[:activity_ids] || []

    activities = Activity.where(id: activity_ids)

    activities.each do |activity|
      unless @group.activities.exists?(id: activity.id)
        @group.activities << activity
      end
    end

    redirect_to groups_path, notice: "Activities successfully added to group."
  end

  def remove_activity
    @group = Group.find(params[:id])
    @activity = Activity.find(params[:activity_id])

    @group.activities.delete(@activity)

    redirect_to group_path(@group), notice: "Activity removed from group."
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      :description
    )
  end
end
