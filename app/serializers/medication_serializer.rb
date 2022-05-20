# frozen_string_literal: true

class MedicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :code, :drone_id, :cover_image

  def cover_image
    rails_blob_path(object.cover_image, only_path: true) if object.cover_image.attached?
  end
end
