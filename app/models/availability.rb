class Availability < ApplicationRecord
  belongs_to :user
  validates :status, presence: true, default: 0
end
