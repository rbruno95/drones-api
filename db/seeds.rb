# frozen_string_literal: true

Drone.delete_all

10.times do
  Drone.create!(
    serial_number: Faker::Alphanumeric.alphanumeric(number: 100),
    model: Drone.models.values.sample,
    weight_limit: rand(400..500),
    battery_capacity: rand(50..100),
    state: Drone.states.values.sample
  )
end
