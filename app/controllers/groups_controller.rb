class GroupsController < ApplicationController
  def index
    @groups = Group.includes(:activities).order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @group = Group.includes(:activities).find(params[:id])
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
