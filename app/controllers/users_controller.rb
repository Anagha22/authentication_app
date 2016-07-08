class UsersController < ApplicationController
	def new
  	@user = User.new
	end
	def index
	end
        def create
        @user = User.new(user_params) 
  		if @user.save 
    		session[:user_id] = @user.id 
    		redirect_to '/' 
  		else 
    		redirect_to '/signup' 
  		end 
        end
	private
        def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
        end
	def new
	
	end
	def create
	@user = User.find_by_email(params[:session][:email])
  		if @user && @user.authenticate(params[:session][:password])
    		session[:user_id] = @user.id
    		redirect_to '/'
  		else
    		redirect_to 'login'
  		end 
	end
	def destroy
	session[:user_id] = nil
   	redirect_to users, :notice => "Logged out"
	end


end
