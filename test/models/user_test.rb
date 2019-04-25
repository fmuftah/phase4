require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  should belong_to(:employee)
  
  should have_secure_password
  should allow_value("fmuftah@andrew.cmu.edu").for(:email)
  should_not allow_value("fatima").for(:email)
  
  context "Creating a context for users" do
    setup do 
      create_employees
      create_users
    end
    
    teardown do
      remove_employees
      remove_users
    end
    
    should "shows that only active employees can have users" do
      assert @alex.active
      assert_not_nil @alex_user
      @ghost = FactoryBot.build(:employee)
      assert @ghost.valid?
    end
    
  end
  
end
