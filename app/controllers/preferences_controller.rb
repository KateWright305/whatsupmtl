class PreferencesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(preference_params)
      redirect_to profile_path, notice: "Preferences updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def preference_params
    params.require(:user).permit(type_ids: [])
  end
end
