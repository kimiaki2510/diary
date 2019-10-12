class RecordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  #before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @record = current_user.records
    if logged_in?
      @record = current_user.records.build  #form_with用
      @records = current_user.records.order(id: :desc).page(params[:page])
    end
  end

  def show
    if current_user == @record.user
      set_record
    else
      redirect_to root_url
    end
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)

    if @record.save
      flash[:success] = '日記が正常に投稿されました'
      redirect_to @record
    else
      @records = current_user.records.order(id: :desc).page(params[:page])
      flash.now[:danger] = '日記が正常に投稿されませんでした'
      render :new
    end
  end

  def edit
    set_record
  end

  def update
    set_record
    if @record.update(record_params)
      flash[:success] = '日記は更新されました'
      redirect_to @record
    else
      flash.now[:danger] = '日記は更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_record
    @record.destroy
    flash[:success] = '日記は削除されました'
    redirect_to root_url
  end

  private

  def set_record
    @record =  Record.find(params[:id])
  end

#Strong Parameter(セキュリティパラメータ)送信されたデータをフィルタリング
  def record_params
    params.require(:record).permit(:title, :content)
  end

  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @records
      redirect_to root_url
    end
  end
end
