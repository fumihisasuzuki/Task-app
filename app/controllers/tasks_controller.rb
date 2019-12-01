class TasksController < ApplicationController
  before_action :set_user
  before_action :logged_in_user
  before_action :correct_user
  
    def index
        @tasks=Task.paginate(page: params[:page], per_page: 20).where(user_id: params[:user_id])
#        @tasks=Task.where(user_id: params[:user_id])
    end
    
    def create
        @task = current_user.tasks.build(tasks_params)
        if @task.save
          flash[:success] = 'タスク「' + @task.name + '」の作成に成功しました。'
#          redirect_to @task
           redirect_to user_tasks_path
        else
            render action: :new
        end
    end


    def new
#        @user = User.find(params[:user_id])
        @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        @task.update_attributes(tasks_params)
        flash[:success] = 'タスク「' + @task.name + '」を更新しました。'
        redirect_to user_task_path
    end
    
    def edit
#        @user = User.find(params[:user_id])
        @task = Task.find(params[:id])
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:success] = 'タスク「' + @task.name + '」を削除しました。'
        redirect_to user_tasks_path
    end
    
  private
    # テーブル「タスク」の各値を代入します。
    def tasks_params
      params.require(:task).permit(:name, :note)
    end
    
    
    # beforeフィルター

    # 現在のユーザーを取得します。
    def set_user
      @user = User.find(params[:user_id])
    end
    
    # ログイン済みのユーザーか確認 :sessons_helperに記載
    
    # アクセスしたユーザーが現在ログインしているユーザー本人か確認します。
    def correct_user
      @user = User.find(params[:user_id])
      unless current_user?(@user)
        flash[:danger] = "他人のタスクへはアクセスできません。"
        redirect_to(root_url)
      end
    end
    
end
