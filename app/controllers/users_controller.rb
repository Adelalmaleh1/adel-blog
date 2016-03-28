class UsersController < ApplicationController
  def create
  	  @user=User.new(user_params)
        if @user.save
        flash[:success] = "Welcome to Adel blog #{@user.username}"
    else
        render 'new'
        end
    
  end

  def edit
  	 @user= User.find(params[:id])
  end

  def show
  	@user= User.find(params[:id])
  end
  private
            def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end
