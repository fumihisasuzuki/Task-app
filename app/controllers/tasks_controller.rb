class TasksController < ApplicationController
    def index
        @tasks=Task.where(user_id: params[:user_id])
    end
    
    def create
        @tasks = current_user.tasks.build(tasks_params)
        @tasks.save
        redirect_to user_tasks_path
    end
    
    def new
        @user = User.find(params[:user_id])
        @task = Task.new
    end

    def show
    end
    
    def update
    end

    def destory
    end
    
  private
    # ログインしている人のタスクリストを作成します。
    def tasks_params
      params.require(:task).permit(:name, :note, :created_at)
    end
end
