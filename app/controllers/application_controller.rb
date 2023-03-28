class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
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
