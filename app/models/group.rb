class Group < ApplicationRecord
  has_many :group_activities, dependent: :destroy
  has_many :activities, through: :group_activities

  validates :name, presence: true
  validates :description, presence: true
end
