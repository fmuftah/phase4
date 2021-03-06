module Contexts
  module StoreFlavorContexts
    # Context for flavors 
    def create_store_flavors
      @chocolate_cmu = FactoryBot.create(:store_flavor, flavor: @chocolate, store: @cmu)
      @chocolate_oakland  = FactoryBot.create(:store_flavor, flavor: @chocolate, store: @oakland)
      @strawberry_cmu = FactoryBot.create(:store_flavor, flavor: @strawberry, store: @cmu)
      @strawberry_oakland = FactoryBot.create(:store_flavor, flavor: @strawberry, store: @oakland)
      @vanilla_cmu = FactoryBot.create(:store_flavor, flavor: @vanilla, store: @cmu)
    end
    
    def remove_store_flavors
      @chocolate_cmu.delete
      @chocolate_oakland.delete
      @strawberry_cmu.delete
      @strawberry_oakland.delete
      @vanilla_cmu.delete
    end
  end
end