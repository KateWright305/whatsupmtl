
class UserPreferencesTool < RubyLLM::Tool

  description "Retrieves the interests and activity preferences of the current user in WhatsUpMTL."

  def initialize(user:)
    @user = user
  end

  def execute
    return { error: "User not found" } unless @user
    preferences = @user.types.pluck(:name)
    {
      user_id: @user.id,
      interests: preferences
    }
  end

end
