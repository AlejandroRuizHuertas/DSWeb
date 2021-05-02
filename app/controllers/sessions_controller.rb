class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username], password_digest: params[:password_digest])
    if @user
      session[:idUsuario] = @user.id
      redirect_to notes_path, notice: "Logged in!"
    else
      redirect_to root_path, notice: "Error! Credential error."
    end
  end

  def destroy
    session.delete(:idUsuario)
    redirect_to root_path, notice: "Logged out!"
  end
end
