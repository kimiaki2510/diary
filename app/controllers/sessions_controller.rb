class SessionsController < ApplicationController
  def new
  end

  def create
    #二段階でデータ取得, emailを小文字化で取得
    email = params[:session][:email].downcase
    #二段階でデータ取得
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end

  private
#login(email, password)をprivateで定義
  def login(email, password)
    @user = User.find_by(email: email)
    #email, passwordの組み合わせでログインの有無が可能
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
