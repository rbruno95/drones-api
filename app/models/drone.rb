# frozen_string_literal: true

class Drone < ApplicationRecord
  validates :serial_number, :model, :weight_limit, :battery_capacity, :state, presence: true
  validates :serial_number, uniqueness: true, length: { in: 1..100 }

  validates :battery_capacity, numericality: { in: 0..100 }
  validates :weight_limit, numericality: { in: 0..500 }

  validate :cannot_load_with_low_battery

  enum model: {
    LightWeight: 0,
    MiddleWeight: 1,
    CruiserWeight: 2,
    HeavyWeight: 3
  }

  enum state: {
    IDLE: 0,
    LOADING: 1,
    LOADED: 2,
    DELIVERING: 3,
    DELIVERED: 4,
    RETURNING: 5
  }

  private

  def cannot_load_with_low_battery
    errors.add(:base, 'This drone cannot load with less battery than 25%') if (battery_capacity < 25) && LOADING?
  end
end
