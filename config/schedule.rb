set :output, "log/cron.log"

ENV.each_key do |key|
  env key.to_sym, ENV[key]
end

set :environment, ENV["RAILS_ENV"]

every :minute do
  rake "periodic_tasks:check_drones"
end