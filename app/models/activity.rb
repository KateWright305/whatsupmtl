class Activity < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
