# frozen_string_literal: true

require 'test_helper'

class DroneTest < ActiveSupport::TestCase
  def setup
    @drone = drones(:valid)
  end

  test 'valid drone' do
    assert @drone.valid?
  end

  test 'valid drone carrying medications' do
    medication = medications(:valid)
    medication.drone = @drone

    assert @drone.valid?
  end

  test 'invalid too long serial' do
    @drone.serial_number = 'A' * 110

    refute @drone.valid?
    assert_not_nil @drone.errors[:serial]
  end

  test 'invalid too much weight limit' do
    @drone.weight_limit = 600

    refute @drone.valid?
    assert_not_nil @drone.errors[:weight_limit]
  end

  test 'invalid battery over 100 percent' do
    @drone.battery_capacity = 120

    refute @drone.valid?
    assert_not_nil @drone.errors[:battery]
  end

  test 'invalid drone carrying medications' do
    medication = medications(:valid)
    medication.weight = 600

    @drone.medications << medication

    refute @drone.valid?
    assert_not_nil @drone.errors[:weight_limit]
  end

  test 'invalid drone cannot load with low battery' do
    @drone.state = Drone.states[:LOADING]
    @drone.battery_capacity = 20

    refute @drone.valid?
    assert_not_nil @drone.errors
  end
end
