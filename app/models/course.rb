class Course < ApplicationRecord
  has_many :sections

  # New course validations
  validates :name, uniqueness: true, length: 3..80
  validates :department, presence: true, length: 3..30
  validates :number, uniqueness: true, length: 5..8
  validates :credit_hours, numericality: { only_integer: true }, length:
      { is: 1 }
end
