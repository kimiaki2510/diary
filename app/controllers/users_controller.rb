class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page].per(25))
  end

  def show
    @user = User.find(params[:id])
    @records = @user.records.order(id: desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash.now
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザ変更がされました'
    else
      flash.now[:danger]
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザは退会されました'
    redirect_to users_url
  end
end
