class UsersController < ApplicationController


    def new
        @user = User.new
        render :new
    end


    def create
        @user = User.new(user_params)

        if @user.save
            session[:session_token] = @user.session_token
            flash[:success] = "Created account."
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            flash.now[:error] = "Failed to create account."
            render :new, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end