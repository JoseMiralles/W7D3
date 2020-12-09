class UsersController < ApplicationController
  def index
    @user = User.find_by(session_token: session[:session_token])
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render :show
    else
      render :status => 404
    end
  end
  
  def new
    @user = User.new
    render :new
  end

  def create

  end
end
