class Activity < ApplicationRecord
  belongs_to :user

  has_many :activity_types, dependent: :destroy
  has_many :types, through: :activity_types
  has_one_attached :photo
  has_many :activity_groups, dependent: :destroy
  has_many :groups, through: :activity_groups

  validates :name, presence: true, uniqueness: {
    scope: %i[user_id starts_at],
    case_sensitive: false,
    message: "Activity is already in your calendar!"
  }
  validates :description, presence: true
  validates :url, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
  # validates :ends_at, presence: true
end
