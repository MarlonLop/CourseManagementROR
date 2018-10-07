require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "section attributes must not be empty" do
    section = Section.new
    assert section.invalid?
    assert section.errors[:semester].any?
    assert section.errors[:section_number].any?
    assert section.errors[:room_number].any?
  end

  test "semester min and max characters" do
    section = Section.new(semester: 'short',
                          section_number: 5,
                          room_number: 'cn109')
    assert section.invalid?
    section.semester = 'semester name too long'
    assert section.invalid?
  end
end
