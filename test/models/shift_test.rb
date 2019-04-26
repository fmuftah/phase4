require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  
  should belong_to(:assignment)
   should have_one(:employee).through(:assignment)
   should have_one(:store).through(:assignment)
   should have_many(:shift_jobs)
   should have_many(:jobs).through(:shift_jobs)
  
  should allow_value(Time.now).for(:start_time)
   should_not allow_value(nil).for(:start_time)
  should allow_value(3.hour.from_now).for(:start_time)
  
  context "Creating a context for shifts" do
    setup do 
      create_stores
      create_employees
      create_assignments
      create_shifts
      # create_jobs
      # create_shift_jobs
      
    end
    
    teardown do
      remove_stores
      remove_employees
      remove_assignments
      remove_shifts
    end
    
     should "have a scope called for_store" do
      assert_equal 5, Shift.for_store(@cmu).size
     end
     
    should "have a scope called for_employee" do
      assert_equal 3, Shift.for_employee(@ed).size
    end
    
    should "have a scope called past" do
      assert_equal 2, Shift.past.size
    end
    
    should "have a scope for upcoming shifts" do
      assert_equal 5, Shift.upcoming.size
    end
    
    should "have a scope called for_next_days" do
      assert_equal 5, Shift.for_next_days(3).size
    end
    
    should "have a scope called for_past_days" do
      assert_equal 1, Shift.for_past_days(2).size
    end
    
    should "have a scope to order chronologically" do
      assert_equal ["Ed", "Ed", "Ben", "Ben", "Kathryn", "Kathryn", "Ed"], Shift.chronological.map{|s| s.employee.first_name}
    end
    
    should "have a scope to order by store " do
      assert_equal ["CMU", "CMU", "CMU", "CMU", "CMU", "Oakland", "Oakland"], Shift.by_store.map{|s| s.store.name}
    end
    
    should "have a scope to order by employee name" do
      assert_equal ["Gruberman, Ed", "Gruberman, Ed", "Gruberman, Ed", "Janeway, Kathryn", "Janeway, Kathryn", "Sisko, Ben", "Sisko, Ben"], Shift.by_employee.map{|s| s.employee.name}
    end
    
    should "have a scope for completed shifts" do
      assert_equal 0, Shift.completed.to_a.size
    end
    
    should "have a scope for incompleted shifts" do
      assert_equal 7, Shift.incompleted.to_a.size
    end
    
    should "have a start_now method" do 
      @ben_shift1.start_now
      @ben_shift1.reload
      date_shift = Time.current - Time.local(2000,1,1,0,0,0)
      assert_in_delta(Time.current.to_i - date_shift, @ben_shift1.end_time.in_time_zone.to_i, 50000)
    end
    
    should "have end_now method" do 
      @ben_shift1.end_now
      @ben_shift1.reload
      date_shift = Time.current - Time.local(2000,1,1,0,0,0)
      assert_in_delta(Time.current.to_i - date_shift, @ben_shift1.end_time.in_time_zone.to_i, 50000)
    end
    
    should "be added to only current assignments" do
      @shift_test_current = FactoryBot.build(:shift, assignment: @assign_ed)
      assert @shift_test_current.valid?
    end
    
    
    
  end
  
end
