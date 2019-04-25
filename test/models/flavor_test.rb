require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)
  
  should validate_presence_of(:name)
  
  context "Creating a context for flavors" do
    setup do 
      create_flavors
    end
    
    teardown do
      remove_flavors
    end
    
    # test 'alphabetical'
    should "shows flavor in alphabetical orders" do
      assert_equal ["Chocolate", "Mango", "Strawberry", "Vanilla"], Flavor.alphabetical.map{|i| i.name}
      
    end
    
    # test 'active'
    should "shows that there are three active flavors" do
      assert_equal ["Chocolate", "Mango", "Vanilla"], Flavor.active.map{|i| i.name}.sort
      assert_equal 3, Flavor.active.size
    end
    
    # test the scope 'inactive'
    should "shows inactive flavors" do
      assert_equal ["Strawberry"], Flavor.inactive.map{|i| i.name}
    end
    
    should "make sure that flavor cant be destroyable" do
      @chocolate.destroy
      assert_equal 2, Flavor.active.size
      assert_equal ["Chocolate", "Mango", "Strawberry", "Vanilla"], Flavor.alphabetical.map{|i| i.name}
    end

  end
end
