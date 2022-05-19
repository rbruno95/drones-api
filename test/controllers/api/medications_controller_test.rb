# frozen_string_literal: true

require 'test_helper'

module Api
  class MedicationsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @drone = drones(:valid)
    end

    test 'should show medications' do
      get api_drone_medications_url(@drone.id), as: :json
      assert_response :success
    end

    test 'should create medication' do
      assert_difference('Medication.count') do
        post api_drone_medications_url(@drone.id), params: {
          medication: {
            name: 'AB',
            weight: 40,
            code: 'ABCD'
          },
          as: :json
        }
      end

      assert_response :created
    end

    test 'should forbid create medication' do
      assert_no_difference('Medication.count') do
        post api_drone_medications_url(@drone.id), params: {
          medication: {
            name: 'AB',
            weight: 40
          },
          as: :json
        }
      end

      assert_response :unprocessable_entity
    end
  end
end
