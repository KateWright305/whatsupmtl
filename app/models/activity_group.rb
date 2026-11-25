class ActivityGroup < ApplicationRecord
  belongs_to :activity
  belongs_to :group

   validates :activity_id, uniqueness: {
    scope: :group_id,
    message: "This activity is already associated with this group"
  }
end
