require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "course attributes must not be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:name].any?
    assert course.errors[:department].any?
    assert course.errors[:number].any?
    assert course.errors[:credit_hours].any?
  end

  test "course name must be unique" do
    course = Course.new(name:        'my course',
                        department:  'comp sci',
                        number:      'cs390p',
                        credit_hours: '4')
    assert_equal 'my course', course.name
    course.name = 'my course 1'
    assert_not_equal 'my course', course.name
  end

  test "credit hours is integer other than zero" do
    course = Course.new(name:        'my course',
                        department:  'comp sci',
                        number:      'cs390p')
    course.credit_hours = 'a'
    assert course.invalid?
    course.credit_hours = 0
    assert course.invalid?
    course.credit_hours = 3
    assert course.valid?
  end
end
