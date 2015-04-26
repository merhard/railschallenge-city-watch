class Responder < ActiveRecord::Base
  self.inheritance_column = nil

  TYPES = %w(Fire Police Medical)

  belongs_to :emergency

  validates :capacity, presence: true, inclusion: { in: 1..5 }
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true

  scope :type, ->(type) { where(type: type) }
  scope :on_duty, -> { where(on_duty: true) }
  scope :available, -> { where(emergency_id: nil) }
  scope :ready, -> { available.on_duty }
  scope :capacity_total, -> { sum(:capacity) }

  delegate :code, to: :emergency, prefix: true, allow_nil: true
end
