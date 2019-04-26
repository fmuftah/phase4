require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  should belong_to(:employee)
  
  should have_secure_password
  should allow_value("fmuftah@andrew.cmu.edu").for(:email)
  should_not allow_value("fatima").for(:email)
  should_not allow_value(nil).for(:email)
  
  context "Creating a context for users" do
    setup do 
      create_employees
      create_users
    end
    
    teardown do
      remove_employees
      remove_users
    end
    
    
  end
  
end
