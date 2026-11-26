class GroupsController < ApplicationController
  def index
  #@groups = Group.includes(:activities).order(created_at: :desc)
    @groups = current_user.groups
    @activities = current_user.activities
  end

  def new
    @group = current_user.groups.build
  end

  # POST /groups
  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: "Group successfully created."
    else
      @activities = current_user.activities
      render :new, status: :unprocessable_entity
    end
  end

  def show
  #@group = Group.includes(:activities).find(params[:id])
  # @activities = Activity.where.not(id: @group.activities.ids)
    @group = current_user.groups.find(params[:id])
    @activities = current_user.activities
  end

  def edit
    @group = current_user.groups.find(params[:id])
    @activities = current_user.activities
  end

  def update
    @group = current_user.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to @group, notice: "Group successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def add_activity
    @group = current_user.groups.find(params[:id])

    activity_ids = params[:activity_ids] || []

    activities = current_user.activities.where(id: activity_ids)

    activities.each do |activity|
      unless @group.activities.exists?(id: activity.id)
        @group.activities << activity
      end
    end

    redirect_to groups_path, notice: "Activities successfully added to group."
  end

  def remove_activity
    @group = current_user.groups.find(params[:id])

    @activity = current_user.activities.find(params[:activity_id])

    @group.activities.delete(@activity)

    redirect_to groups_path, notice: "Activity removed from group."
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy

    redirect_to groups_path, notice: "Group successfully deleted."
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      :description
    )
  end
end
