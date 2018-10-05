class Section < ApplicationRecord
  belongs_to :course
  has_many :enrollments
  has_many :students, through: :enrollments

  def d_section
    "#{course.name} | Section: #{section_number} | #{semester}"
  end
end
