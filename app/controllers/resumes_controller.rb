class ResumesController < ApplicationController
    def index
        @resumes = Resume.order(created_at: :desc)
        # all比較像是placeholder的概念
    end

    def new
        @resume = Resume.new 
    end

    def create
        @resume = Resume.new(resume_params) 

        if @resume.save
            redirect_to resumes_path, notice: '新增履歷成功'
        else
            render :new
            # render只是渲染，但網址一樣還是會變
        end
    end

    

    private
    def resume_params
        params.require(:resume).permit(:name, :email, :tel, :skill, :intro, :city, :education, :experience, :portfolio)
    end
end
