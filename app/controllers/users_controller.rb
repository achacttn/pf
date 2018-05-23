class UsersController < ApplicationController

    before_action :check_if_logged_in, only: [:profile]

    def new
        @user = User.new
    end

    def create
        user = User.new( user_params )
        if params[:file].present?
            req = Cloudinary::Uploader.upload(params[:file])
            user.image = req["public_id"]
        # add an 'else' statement here for default pic
        end
        user.save
        if user.persisted?
            session[:user_id] = user.id
            redirect_to user_path( user )
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find( params[:id] )
        # uniq array below
        @user_comments = []
        @user_subjects = []
        @user.comments.each do |cmt|
            @user_comments.push(cmt)
            @user_subjects.push(cmt.subject)
        end
        @user_subjects.uniq!
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if params[:file].present?
            req = Cloudinary::Uploader.upload(params[:file]) 
            user.image = req["public-id"]
        end
        
        user.update_atttributes( user_params )
        user.save
        redirect_to(user_path(user))
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end

end