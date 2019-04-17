require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  
  should belong_to(:assignment)
  should have_one(:employee).through(:assignment)
  should have_one(:store).through(:assignment)
  should have_many(:shift_jobs)
  should have_many(:jobs).through(:shift_jobs)
  
end
