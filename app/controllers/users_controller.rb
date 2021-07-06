class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        begin
            @user = User.new(user_params)
            if @user.valid?
                if @user.save
                    redirect_to users_path, success: "Successfully created"
                else
                    redirect_to new_user_path
                end
            else
                render new_user_path(@user)
            end
        rescue => exception
            redirect_to users_path, danger: exception.message
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        begin
            @user = User.find(params[:id])
            if @user.update(user_params)
                redirect_to users_path, success: "Successfully updated"
            end
        rescue => exception
            redirect_to users_path, danger: exception.message
        end
        
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to users_path, success: "Successfully deleted"
        end
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :age)
        end
end
