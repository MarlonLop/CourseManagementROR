class Student < ApplicationRecord
  has_many :enrollments
  has_many :sections, through: :enrollments

  validates :name, length: 3..80, format: { with: /\A[a-zA-Z\s]+\z/, message:
      'field allows only letters' }
  validates :student_number, uniqueness: true, numericality:
      { only_integer: true }, length: { is: 6 }
end
