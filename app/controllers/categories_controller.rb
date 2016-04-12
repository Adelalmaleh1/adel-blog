class CategoriesController < ApplicationController
	before_action :require_login, axcept: [:index]

	def index
		@categories=Category.all
	end

	def show
	end

	def new
		@category= Category.new
	end

	def create
		@category=Category.new(category_params)
      if @category.save
      flash[:success] = "category was created successfully"
      redirect_to categories_path
    
      else
    render 'new'
      end
	end

	private
    def category_params
    params.require(:category).permit(:name)
  end

		def require_login
    unless current_user
      redirect_to user_session_path
      flash[:danger] = "Please login first"
    end
  end
   
end
