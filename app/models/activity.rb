class Activity < ApplicationRecord
  has_one_attached :photo
  has_many :group_activities, dependent: :destroy
  has_many :groups, through: :group_activities

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
