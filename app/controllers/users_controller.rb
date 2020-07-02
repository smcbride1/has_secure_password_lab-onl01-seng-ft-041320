class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)
        return redirect_to new_user_path if !@user.save
        session[:user_id] = @user.id
        redirect_to welcome_path
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end