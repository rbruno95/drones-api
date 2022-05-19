namespace :periodic_tasks do
  desc "Check drones battery levels"
  task check_drones: :environment do
    Drone.find_each do |drone|
      DroneLog.create(battery_capacity: drone.battery_capacity, drone_id: drone.id)
    end
  end
end
