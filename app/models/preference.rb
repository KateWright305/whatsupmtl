class Preference < ApplicationRecord
  belongs_to :type
  belongs_to :user

  validates :user_id, uniqueness: { scope: :type_id }
end
