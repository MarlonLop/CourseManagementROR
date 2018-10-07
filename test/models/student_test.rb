require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "student attributes must not be empty" do
    student = Student.new
    assert student.invalid?
    assert student.errors[:name].any?
    assert student.errors[:student_number].any?
  end

  test "student name is only letters and within 3 to 80 chars" do
    student = Student.new(name: "Person234 l4",
                          student_number: 100001)
    assert student.invalid?
    student.name = 'me'
    assert student.invalid?
    student.name = 'meshfjahsljhaljhgaljhdgjahdghajgldjghlajshlgjhalsjhg
                    dsjkhajdhs;gjhs;dhjgsjhfdjghsjsfskfdhgkhsfdkhgsfhg
                    kdshghdkhgkhghghgkfhgjlshfljkghlsj'
    assert student.invalid?
    student.name = 'John Smith'
    assert student.valid?
  end

  test "student number is 6 digits" do
    student = Student.new(name: 'Billy Bob',
                          student_number: 10000)
    assert student.invalid?
    student.student_number = 123456
    assert student.valid?
  end
end
