class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new 
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )

        if @user
            session[:session_token] = @user.reset_session_token!
            flash[:success] = "You're logged in"
            redirect_to cats_url
        else 

            flash.now[:error] = "Bad login"
            render :new, status: 401
        end

    end

    def destroy
    end


end