require 'test_helper'

class JobTest < ActiveSupport::TestCase
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)
  
  should validate_presence_of(:name)
  
  context "Creating a context for jobs" do
    setup do 
      create_jobs
    end
    
    teardown do
      remove_jobs
    end
    
    should "shows that there are four jobs in in alphabetical order" do
      assert_equal ["Cashier", "Making Icecream", "Mopping"], Job.alphabetical.map{|i| i.name}
    end
    
    should "shows that there are three active jobs" do
      assert_equal 2, Job.active.size
      assert_equal ["Cashier", "Making Icecream"], Job.active.map{|j| j.name}.sort
    end
    
    should "shows that there is one inactive job" do
      assert_equal 1, Job.inactive.size
      assert_equal ["Mopping"], Job.inactive.map{|i| i.name}.sort
    end
    
    # should "correctly assess when a job is destroyable" do
    #   create_employees
    #   create_stores
    #   create_assignments
    #   create_shifts
    #   create_shift_jobs
    #   assert @making.destroy
    #   remove_shift_jobs
    #   remove_employees
    #   remove_stores
    #   remove_assignments
    #   remove_shifts
    # end
    
    # should "make an undestroyable job inactive" do
    #   create_employees
    #   create_stores
    #   create_assignments
    #   create_shifts
    #   create_shift_jobs
    #   deny @cashier.destroy
    #   @cashier.reload
    #   deny @cashier.active
    #   remove_shift_jobs
    #   remove_employees
    #   remove_stores
    #   remove_assignments
    #   remove_shifts
    # end
    
  end
end
