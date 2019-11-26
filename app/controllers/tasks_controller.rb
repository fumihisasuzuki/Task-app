class TasksController < ApplicationController
    def index
        @tasks=Task.where(user_id: params[:user_id])
    end
    
    def create
        @task = current_user.tasks.build(tasks_params)
        if @task.save
          flash[:success] = '新規作成に成功しました。'
#          redirect_to @task
           redirect_to user_tasks_path
        else
            render action: :new
        end
    end


    def new
        @user = User.find(params[:user_id])
        @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        @task.update_attributes(tasks_params)
        redirect_to user_task_path
    end
    
    def edit
        @user = User.find(params[:user_id])
        @task = Task.find(params[:id])
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to user_tasks_path
    end
    
  private
    # テーブル「タスク」の各値を代入します。
    def tasks_params
      params.require(:task).permit(:name, :note)
    end
end
