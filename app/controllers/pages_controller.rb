class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @filter = "All";
    @today = Date.today.strftime("%F")
      if params[:filter] && params[:filter] !="All"
        @filter = "Today"
      end
    @cat_list = current_user.categories.where(is_deleted: false).order(:category_name)
    @category = current_user.categories.new
    # @tasks = current_user.tasks.where(due_date: Date.today.strftime("%F"))

  end
end
