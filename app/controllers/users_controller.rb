 class UsersController < ApplicationController

      def show
        @user = User.find(params[:id])
        @microposts = @user.microposts    # NEW LINE
      end

     def new
        @user = User.new
      end
       def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
           # Handle a successful save.
           remember @user       #  NEW LINE
      flash[:success] = "Welcome to the Sample App!"    # NEW LINE
           redirect_to @user   # NEW LINE
           flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
        else
            # Handle an unsuccessful save. 
             render 'new'     # NEW LINE        
        end
      end
    end