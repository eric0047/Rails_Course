class SessionsController < ApplicationController
  def create
    user = User.login(email: params[:user][:email],
      password: params[:user][:password])

    if user
      session[:_user_resume_dev_] = user.id
      # 要給他一個session的值，session後面的key名字亂取就可以了，主要是讓使用者登入時，給使用者一張與加密過後session一樣的cookie
      redirect_to root_path, notice: "登入成功"
    else
      redirect_to sign_in_users_path, alert: "登入失敗"
    end 
  end

  def destroy
    session[:_user_resume_dev_] = nil
    # 登出就是強制把session幹掉，使用者的cookie也會同時失效
    redirect_to root_path, notice: "已登出"
  end
end
