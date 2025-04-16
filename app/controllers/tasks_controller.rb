class TasksController < ApplicationController
add_flash_types :info, :error, :warning
before_action :set_category, only: [:edit,:update,:destroy,:create,:index,:show]
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
def index
        # @category = current_user.categories.find(params[:category_id])
        if params[:filter] && params[:filter] !="All"
            today = Date.today.strftime("%F")
            @tasks = @category.tasks.where(due_date: today)
        else
            @tasks = @category.tasks
        end
        # @tasks = @category.tasks
        @task = @category.tasks.new
    end

    def show
         @task = @category.tasks.find(params[:id])
    end

    def new ;end

    def edit 
        # @category = current_user.categories.find(params[:category_id])
        @tasks = @category.tasks
        @task = @category.tasks.find(params[:id])
    end

    def update 
        #  @tasks = @category.tasks
         @task = @category.tasks.find(params[:id])
         @task.user_id = current_user.id
        # binding.b
         if @task.update(task_params)
            flash[:info] = " Task successfuly updated"
            redirect_to category_tasks_path(@category)
         else
            flash[:info] = " Please check ur details"
            render :edit, status: :unprocessable_entity
         end
    end

    def create 
         @tasks = @category.tasks
         @task = @category.tasks.build(task_params)
         @task.user_id = current_user.id
        # binding.b
         if @task.save
            flash[:success] = " Task successfuly created"
            redirect_to category_tasks_path(@category)
         else
            flash[:danger] = " Please check ur details"
            render :index, status: :unprocessable_entity
         end
    end

    def destroy 
        @task = @category.tasks.find(params[:id])
        @task.destroy
        flash[:success] = "Deleted successfully"
        # redirect_to article_path(@article), status: :see_other
        redirect_to category_tasks_path(@category), status: :see_other
    end

    private
    def task_params
        params.require(:task).permit(:task_name,:desc,:due_date)
    end
     def set_category
        @category = current_user.categories.find(params[:category_id])
    end

    def record_not_found
        # @category = current_user.categories.find(params[:category_id])
        flash[:danger] = "No record found"
        redirect_to root_path, status: :see_other
    end
end
