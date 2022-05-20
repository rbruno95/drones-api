# frozen_string_literal: true

class DroneSerializer < ActiveModel::Serializer
  attributes :id, :serial_number, :model, :weight_limit, :battery_capacity, :state
end
