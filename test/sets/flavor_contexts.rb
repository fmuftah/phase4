module Contexts
  module FlavorContexts
    
    # Context for flavors 
    def create_flavors
      @vanilla  = FactoryBot.create(:flavor)
      @chocolate  = FactoryBot.create(:flavor, name:"Chocolate")
      @strawberry = FactoryBot.create(:flavor, name: "Strawberry", active: false) 
      @mango  = FactoryBot.create(:flavor, name: "Mango")
    end
    
    def remove_flavors
      @vanilla.destroy
      @chocolate.destroy
      @strawberry.destroy
      @mango.destroy
    end
  end
end