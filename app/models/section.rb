class Section < ApplicationRecord
  belongs_to :course
  has_many :enrollments
  has_many :students, through: :enrollments

  # New sections validations
  validates :semester, length: { minimum: 9, maximum: 11, message:
            'Ex.(Fall 2018), maximum 11 characters' }
  validates :section_number, length: 1..2,
            numericality: { only_integer: true, other_than: 0,
                            less_than_or_equal_to: 20 }
  validates :room_number, length: 4..10

  def d_section
    "#{course.name} | Section: #{section_number} | #{semester}"
  end
end
