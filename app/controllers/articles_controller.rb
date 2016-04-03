class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :add_current_user, axcept: [:index]



	def index
		@articles= Article.paginate(:page => params[:page], :per_page => 5)
		

	end

	def new
		@article=Article.new
	end

	def edit
	end


	def create
		@article=Article.new(article_params)
		@article.user=current_user
		if @article.save
		flash[:success] = "Article was successfully created"
		redirect_to article_path(@article)
		else
		render 'new'
		end
	end

	def update
		if @article.update(article_params)
		flash[:success]= "Article was successfully updated"
		redirect_to article_path(@article)
		else 
		render 'edit'
		end
	end	

	def show
	end

	def destroy
		
		flash[:danger] = "article was successfully deleted"
		redirect_to article_path
	end



	private 
	def set_article
		@article = Article.find(params[:id])
	end

		def article_params
		params.require(:article).permit(:title, :description)
	end

	def add_current_user
		unless user_signed_in?
			
			redirect_to user_session_path
			flash[:danger] = "please sign in"
		end
	end

end

