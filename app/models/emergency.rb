class Emergency < ActiveRecord::Base
  has_many :responders

  validates :code, presence: true, uniqueness: true
  validates :fire_severity, :police_severity, :medical_severity,
            presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.full_responses
    [
      where(full_response: true).size,
      all.size
    ]
  end

  def resolved?
    resolved_at
  end
end
