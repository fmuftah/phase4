module Contexts
  module JobContexts
    def create_jobs
      @cashier = FactoryBot.create(:job)
      @mopping = FactoryBot.create(:job, name: "Mopping", active: false)
      @making = FactoryBot.create(:job, name: "Making Icecream")
    end

    def remove_jobs
      @cashier.destroy
      @mopping.destroy
      @making.destroy
    end
  end
end