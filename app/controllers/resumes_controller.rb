class ResumesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_resume, only: [:show, :edit, :update, :destroy] 

    def index
        # @resumes = Resume.order(created_at: :desc)
        # @resumes = Resume.where(user: current_user)
        #                     .order(created_at: :desc)
        # all比較像是placeholder的概念
        if current_user.user?
            @resumes = current_user.resumes.order(created_at: :desc)
          else
            @resumes = Resume.order(created_at: :desc)
          end
      
          @resumes = @resumes.search(params[:keyword]) if params[:keyword].present?
    end

    def new
        @resume = Resume.new 
        authorize @resume
    end

    def create
        # @resume = Resume.new(resume_params) 
        @resume = current_user.resumes.new(resume_params)
        authorize @resume
        
        # @resume.user = current_user

        if @resume.save
            redirect_to resumes_path, notice: '新增履歷成功'
        else
            render :new
            # render只是渲染，但網址一樣還是會變
        end
    end

    def show 
    #    @resume = Resume.find(params[:id]) 
    end

    def edit
    end

    def update

        if @resume.update(resume_params)
            redirect_to edit_resume_path(@resume.id), notice: '更新成功'
            # redirect_to @resume
        else
            render :edit
        end
    end

    def destroy
        @resume.destroy
        redirect_to resumes_path, notice: '刪除成功'
    end

    private
    def resume_params
        params.require(:resume).permit(:name, :email, :tel, :skill, :intro, :city, :education, :experience, :portfolio)
        # .merge(user: current_user)
    end
    def find_resume
        # @resume = Resume.find(params[:id])
        if current_user.role == 1
            @resumes = current_user.resumes.find(params[:id]) 
        else
            @resumes = Resume.order(created_at: :desc)
        end
    end
end
