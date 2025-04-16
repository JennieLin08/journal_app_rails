class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit,:update,:destroy]

  def index; end

  def show; end

  def new
     @category = current_user.categories.new
  end

  def edit; end

  def create
    # @cat_list = current_user.categories
    @category= current_user.categories.new(category_params)
     if @category.save
      flash[:success] = "Category successfully Save!"
      redirect_to root_path
    else
      flash[:danger] = "Please check your details!"
      render "pages/home", status: :unprocessable_entity
    end
  end

  def update
     if @category.update(category_params)
      # binding.b
      flash[:success] = "Category successfully updated!"
      redirect_to root_path
    else
      # binding.b
      flash[:danger] = "Please check your details!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @category.destroy
    @category.update(is_deleted: true)
     flash[:success] = "Deleted successfully"
    redirect_to root_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :description)
  end

   def set_category
       @category = current_user.categories.find(params[:id])
   end

end
