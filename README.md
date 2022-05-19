# Drones API

## Description

This project contains a REST API for managing drones.
Implemented using Ruby on Rails.

## Running the app

To avoid complex installations to run the project, you can create a docker image and run it locally.

You only need to do:

```
docker-compose up -d
```

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