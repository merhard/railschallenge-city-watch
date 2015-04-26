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

  def self.capacity_total_of_type(type)
    type(type).capacity_total
  end

  def self.available_capacity_total_of_type(type)
    available.capacity_total_of_type(type)
  end

  def self.on_duty_capacity_total_of_type(type)
    on_duty.capacity_total_of_type(type)
  end

  def self.ready_capacity_total_of_type(type)
    ready.capacity_total_of_type(type)
  end
end
