# frozen_string_literal: true

class DroneLog < ApplicationRecord
  belongs_to :drone

  validates :battery_capacity, presence: true
end
