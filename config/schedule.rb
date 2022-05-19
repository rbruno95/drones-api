set :output, "log/cron.log"

set :environment, "development"

every :minute do
  rake "periodic_tasks:check_drones"
end