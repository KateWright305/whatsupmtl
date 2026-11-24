class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @groups = Group.all
  end
end

def create
  @activity = Activity.new(activity_params)

  if params[:activity][:photo].present?

    result = Cloudinary::Uploader.upload(
      params[:activity][:photo].tempfile.path,
      folder: "whatsupmtl/activities"
    )

    @activity.img = result["public_id"]
  end

  if @activity.save
    redirect_to @activity, notice: "Activity created successfully!"
  else
    render :new, status: :unprocessable_entity
  end
end

private

def activity_params
  params.require(:activity).permit(:name, :description)
end
