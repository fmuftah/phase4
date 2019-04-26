module DemosHelper
    def login(user)
        session[:user_id] = user.id
    end
    
    def current_user
        @current_user ||=  User.find_by(id: session[:user_id])
    end
    
    def logged_in?
       !current_user.nil?
    end
    
    def logout
       session.delete(:user_id)
       @current_user = nil
    end
    
    def current_user_store
        @current_user_store ||=  Store.find_by(id: session[:user_id])
    end
    
    def current_user_employee
        @current_user_employee ||=  Employee.find_by(id: session[:user_id])
    end
end
