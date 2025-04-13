class CategoriesController < ApplicationController
    add_flash_types :info, :error, :warning
    # before_action :category_params , only: [:create,:update]
    before_action :set_category, only: [:edit,:update,:destroy]

  def index
  end

  def show
    
  end

  def new
     @category = current_user.categories.new
  end

  def edit
   
 
  end



  

  def create
    # binding.b
    @cat_list = current_user.categories
    @category= current_user.categories.new(category_params)

    #  @category.id != nil
     if @category.save
      flash[:warning] = "Category successfully Save!"
      redirect_to root_path
    else
      # binding.b
      flash[:warning] = "Please check your details!"
      render "pages/home", status: :unprocessable_entity
    end

  end


  def update
      
  

     if @category.update(category_params)
      # binding.b
      flash[:info] = "Category successfully updated!"
      redirect_to root_path
    else
      # binding.b
      flash[:warning] = "Please check your details!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

    @category.destroy
     flash[:warning] = "Deleted successfully"
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
