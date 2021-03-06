class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to "/admin/management"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_edit)
      redirect_to "/admin/management"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password_digest)
  end

  def user_edit
    params.require(:user).permit(:username, :first_name, :last_name)
  end
end
