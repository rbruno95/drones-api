# Drones API

## Description

This project contains a REST API for managing drones.
Implemented using Ruby on Rails.

## Running the app

To avoid complex installations to run the project, you can create a docker image and run it locally.

You only need to do the following steps:

```
# build the docker images
$ docker-compose build

# create, migrate and seed the database
$ docker-compose run web rake db:create db:migrate db:seed

# run the images in the background
$ docker-compose up -d
```

By default the application is going to run on http://0.0.0.0:3000

### About audit drone battery periodic task

Once you run the images, you can check how a periodic task is
inserting into the database info about the battery level of every drone

To check that, you need to do the following steps:

```
Enter to the drones-api_web_1 container in interactive mode
$ docker exec -it drones-api_web_1 bash

To enter to an irb session where you can query the database using ActiveRecord ORM
$ rails c

To see the logs 
> DroneLog.all
```

The task is going to run every minute,
so if you wait a little bit and
you do the same query you are going to find more logs

## API

There are 5 endpoints:

```
To obtain all the registered drones
GET host:port/api/drones

To obtain an specific drone
GET host:port/api/drones/:id

To register a drone
POST host:port/api/drones

To get all the medications that is loading an drone
GET host:port/api/drones/:id/medications

To load a drone with a medication
POST host:port/api/drones/:id/medications
```

### API endpoints examples via curl

```
curl host:port/api/drones \
    -H "Accept: application/json"

curl host:port/api/drones/:id \
    -H "Accept: application/json"

curl host:port/api/drones \
    -H "Content-Type: application/json" \
    -d \
    ' {
        "drone": {
            "serial_number": "abcd",
            "battery_capacity": 80,
            "weight_limit": 400,
            "model": "CruiserWeight",
            "state": "IDLE"
        }
    } '

curl host:port/api/drones/:id/medications \
    -H "Accept: application/json"

curl host:port/api/drones/:id/medications \
    -H "Content-Type: application/json" \
    -d \
    ' {
        "medication": {
            "name": "fooo",
            "weight": 30,
            "code": "ADBD"
        }
    } '
    
```