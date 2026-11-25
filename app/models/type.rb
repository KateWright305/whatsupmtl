class Type < ApplicationRecord
  has_many :activities, through: :activity_types
  has_many :activity_types, dependent: :destroy

  has_many :users, through: :preferences
  has_many :preferences, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
