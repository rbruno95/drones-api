# frozen_string_literal: true

module Api
  class MedicationsController < ApplicationController
    include ActionController::Serialization

    before_action :find_drone

    def index
      render json: @drone.medications
    end

    def create
      medication = @drone.medications.build(permitted_params)

      if medication.save
        render json: medication, status: :created
      else
        render json: { errors: medication.errors }, status: :unprocessable_entity
      end
    end

    private

    def permitted_params
      params.require(:medication).permit(:name, :weight, :code)
    end

    def find_drone
      @drone = Drone.find(params[:drone_id])
    end
  end
end
