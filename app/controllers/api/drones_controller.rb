# frozen_string_literal: true

module Api
  class DronesController < ApplicationController
    def index
      render json: Drone.all
    end

    def show
      render json: Drone.find(params[:id])
    end

    def create
      drone = Drone.new(permitted_params)

      if drone.save
        render json: drone, status: :created
      else
        render json: { errors: drone.errors }, status: :unprocessable_entity
      end
    end

    private

    def permitted_params
      params.require(:drone).permit(:serial_number,:model, :weight_limit, :battery_capacity, :state)
    end
  end
end
