class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
# binding.b
    @cat_list = current_user.categories
    @category = current_user.categories.new
    
  end
end
