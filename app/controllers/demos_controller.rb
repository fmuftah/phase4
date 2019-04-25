class DemosController < ApplicationController
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:demo][:email])
        if user && user.authenticate(params[:demo][:password])
            login(user)
            redirect_to user
        else
            flash.now[:danger] = "Invalid email or password"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to home_path, notice: "Logged out!"
    end

end
