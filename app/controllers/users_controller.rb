class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create( user_params )

        if user.persisted?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to( new_user_path )
        end
    end

    def show
        @user = User.find( params[:id] )
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :image, :password, :password_confirmation)
    end

end