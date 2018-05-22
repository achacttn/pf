class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by email: params[:email]
        if user.present? && user.authenticate( params[:password] )
            session[:user_id] = user.:user_id
            redirect_to user_path( user )
        else
            flash[:error] = "Invalid login credentials."
            redirect_to login_path
        end
    end

    def destroy
        session[:user_ud] = nil
        redirect_to login_path
    end
end