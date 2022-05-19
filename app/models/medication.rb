class Medication < ApplicationRecord
  belongs_to :drone

  validates :name, format: { with: /\A[\w\-]+\z/ }
  validates :code, format: { with: /\A[A-Z\d_]+\z/ }
  validates :weight, numericality: true
  validates :name, :code, :weight, presence: true
end
