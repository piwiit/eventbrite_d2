class Event < ApplicationRecord
  validates :start_date,
            :duration,
            :title,
            :price,
            :location,
            :description,
            presence: true
  validate :start_must_be_before_end_time
  validate :ismultiple_of_5?
  validates :duration, numericality: { only_integer: true }
  validates :title, length: { in: 5..140 }
  validates :description, length: { in: 20..1000 }
  validates :price, inclusion: 1..1000

  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances

  def start_must_be_before_end_time
    start_date > Time.now
  end

  def ismultiple_of_5?
    unless duration % 5 == 0 && duration > 0
      errors.add(:duration, "shouldn't be 0 and need to be multiple of 5 !")
    end
  end
end
