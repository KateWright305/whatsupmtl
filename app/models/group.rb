class Group < ApplicationRecord
  has_many :activity_groups, dependent: :destroy
  has_many :activities, through: :activity_groups

  validates :name, presence: true
  validates :description, presence: true
end
