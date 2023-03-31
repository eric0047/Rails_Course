class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :user_signed_in?, :current_user

  private
  def user_signed_in?
    session[:_user_resume_dev_].present?
  end

  def current_user
    return User.find_by(id: session[:_user_resume_dev_]) if user_signed_in?

    return nil
  end

  def authenticate_user!
    if not user_signed_in?
      redirect_to sign_in_users_path
    end
  end

  def record_not_found
    ## render 的起始位置在View 所以可以使用 render :new 取得view裡面的new.html.erb
    render file: Rails.root.join('public', '404.html'),
            ## 從專案的根目錄去找，把public資料夾404檔案加進來
            layout: false,
            ##把layout拿掉
            status: 404 and return 
            ##把網頁狀態改成404(不然會維持在200)，return是怕會有double render的狀況佳的保險
  end
end
