require 'test_helper'

class StoreFlavorTest < ActiveSupport::TestCase
  
  should belong_to(:store)
  should belong_to(:flavor)
  
  should validate_presence_of(:store_id)
  should validate_presence_of(:flavor_id)
  
end
