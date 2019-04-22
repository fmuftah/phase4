require 'test_helper'

class ShiftJobTest < ActiveSupport::TestCase
  should belong_to(:shift)
  should belong_to(:job)
  
  should validate_presence_of(:job_id)
  should validate_presence_of(:shift_id)
end
