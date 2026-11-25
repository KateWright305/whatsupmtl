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
      redirect_to @group, notice: "Group successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @group = Group.includes(:activities).find(params[:id])
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
