class SessionsController < ApplicationController
    skip_before_action :authenticate_user!
    def new
    end

    def create
        @lita = User.find_or_create_by(username:"Lita", password:"000000", email:"lita@lita.com")
        @user = User.find_by(username:params[:username],password:params[:password])
        @first_user = User.find_by(username:params[:username])
        unless @first_user
            flash[:notice] = "首次登录，请先注册"
            # render action: :new
            redirect_to register_path
        else
            if @user
                if @user.username == "Lita"
                    flash[:notice] = "Lita是机器人，请重新输入"
                    redirect_to root_path
                else
                    session[:user_id] = @user.id
                    session[:user_email] = @user.email
                    flash[:notice] = "登录成功"
                    redirect_to chats_path
                end
            else
                flash[:notice] = "用户名或密码不正确"
                redirect_to root_path
                # render action: :new
                # redirect_to new_user_path
            end
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private
    def user_params
      params.permit(:username)
    end

end
    # def new
    #     if params[:username].present?
    #     @user = User.find_or_create_by(username: params[:username], email: "user@user.com")
    #     if @user.username == 'lita'
    #         flash[:notice] =  "lita是机器人，请换个名字"
    #         redirect_to new_session_path
    #     else
    #         session[:user_id] = @user.id
    #         session[:user_email] = @user.email
    #         redirect_to chats_path
    #     end
    #     else
    #     @user = User.new
    #     end
    # end

    # def create
    #     @user = User.find_by(username:params[:username],password:params[:password])
    #     if @user
    #         session[:user_id] = @user.id
    #         session[:user_email] = @user.email
    #         flash[:notice] = "登录成功"
    #         # redirect_to root_path
    #         redirect_to chats_path
    #     else
    #         flash[:notice] = "用户名或密码不正确"
    #         render action: :new
    #     end
    # end

