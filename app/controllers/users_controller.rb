class UsersController < ApplicationController
    skip_before_action :authenticate_user!
    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:username, :password, :email))
        if @user.save
            if @user.username == "lita"
                flash[:notice] = "lita是机器人，请换个名字"
                render action: :new
            else
                flash[:notice] = "注册成功，请登录"
                redirect_to new_session_path
            end
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.all
    end

end
