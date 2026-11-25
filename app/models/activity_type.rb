class ActivityType < ApplicationRecord
  belongs_to :activity
  belongs_to :type

  validates :type_id, uniqueness: { scope: :activity_id }
end
