# frozen_string_literal: true

Medication.delete_all
Drone.delete_all

10.times do
  drone = Drone.create!(
    serial: Faker::Alphanumeric.alphanumeric(number: 100),
    model: Drone.models.values.sample,
    weight_limit: rand(400..500),
    battery: rand(50..100),
    state: Drone.states.values.sample
  )

  2.times do
    medication = Medication.create!(
      name: Faker::Alphanumeric.alphanumeric(number: 10),
      weight: rand(2..50),
      code: Faker::Code.asin,
      drone: drone
    )

    image = File.open(Rails.root.join('test', 'fixtures', 'files', 'pills.png'))
    medication.cover_image.attach(io: image, filename: 'pills.png')
  end
end
