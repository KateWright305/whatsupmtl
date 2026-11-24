class GroupActivity < ApplicationRecord
  belongs_to :group
  belongs_to :activity

   validates :activity_id, uniqueness: {
    scope: :group_id,
    message: "This activity is already associated with this group"
  }
end
