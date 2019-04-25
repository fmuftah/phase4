module Contexts
  module UserContexts
    # Context for users; assumes initial context for employees already set 
    def create_users
      @ed_user = FactoryBot.create(:user, employee: @ed, email: "ed@hotmail.com")
      puts @ed_user.email
      @cindy_user = FactoryBot.create(:user, employee:@cindy, email: "cindy@gmail.com")
      @ben_user = FactoryBot.create(:user, employee:@ben, email: "ben@hotmail.com")
      @alex_user = FactoryBot.create(:user, employee:@alex, email: "alex@yahoo.com")
      
    end
    
    def remove_users
      @ed_user.destroy
      @cindy_user.destroy
      @ben_user.destroy
      @alex_user.destroy
    end

  end
end