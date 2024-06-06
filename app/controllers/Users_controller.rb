class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def edit
    # @user = user.find(params[:id])
  end

  def show #add
    # @user = user.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "投稿が完了しました。"
    else
      render :new
    end
  end

  def update
    
    if @user.update(user_params)
      redirect_to users_path, notice: "編集が完了しました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "削除が完了しました。", status: :see_other
  end

  private
  def user_params
    params.require(:user).permit(:title, :content)
  end
  
  def set_user
    @user = User.find(params[:id]) #update > add
  end
end
