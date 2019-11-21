class TasksController < ApplicationController
    def index
        @tasks=Task.where(user_id: params[:user_id])
    end
    def create
    end
    
  private
    # 1ヶ月分の勤怠情報を扱います。
    def tasks_params
      params.require(:user).permit(tasks: [:name, :note, :created_at])[:tasks]
    end
end
