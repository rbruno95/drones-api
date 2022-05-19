require "test_helper"

module Api
  class DronesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @drone = drones(:valid)
    end

    test 'should show drones' do
      get api_drones_url, as: :json
      assert_response :success
    end

    test 'should show drone' do
      get api_drone_url(@drone), as: :json
      assert_response :success

      json_response = JSON.parse(response.body)
      assert_equal @drone.as_json, json_response
    end

    test 'should create drone' do
      assert_difference('Drone.count') do
        post api_drones_url, params: {
          drone: {
            serial_number: 'ABCD',
            battery_capacity: 40,
            model: 'LightWeight',
            state: 'IDLE',
            weight_limit: 400
          },
          as: :json
        }
      end

      assert_response :created
    end

    test 'should forbid create drone' do
      assert_no_difference('Drone.count') do
        post api_drones_url, params: {
          drone: {
            battery_capacity: 50,
            model: 'LightWeight',
            state: 'IDLE',
            weight_limit: 400
          },
          as: :json
        }
      end

      assert_response :unprocessable_entity
    end
  end
end
