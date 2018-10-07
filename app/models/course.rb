class Course < ApplicationRecord
  has_many :sections

  # Makes sure a new course is not created with empty fields
  #validates :name, :department, :number, :credit_hours, presence: true
  validates :name, uniqueness: true, length: 3..80
  validates :department, presence: true, length: { maximum: 25 }
  validates :number, uniqueness: true, length: 5..7
  validates :credit_hours, numericality: { only_integer: true}, length: { is: 1 }
end
