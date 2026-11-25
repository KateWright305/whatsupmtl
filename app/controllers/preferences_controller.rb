class PreferencesController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(preference_params)
      redirect_to profile_path, notice: "Preferences updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def preference_params
    params.require(:user).permit(type_ids: [])
  end
end
